define ["angular", "json!data", "components/ngIsotope", "components/project-card/index", "font!google,families:[Abel]"], (angular, data) ->
  angular.module("portfolio", ["ngIsotope", "project-card"])
    .controller "portfolioCtrl", ["$scope", "$http", ($scope, $http) ->
      projects = data.projects
      for project in projects
        project.employer = data.employers[project.employer] if project.employer

      addRepos = (repos) ->
        projects = []
        projects.push(repo) for repo in repos when data.repos.indexOf(repo.name) > -1
        $scope.projects = $scope.projects.concat projects

      $scope.projects = projects

      $http.get("https://api.github.com/users/jpka/repos?type=owner")
        .success(addRepos)
        .error -> $http.get("ghMockData.json").success addRepos
    ]
