<template>
  <div>
    <ul id="dropdown" class="dropdown-content">
      <li><router-link to="/"><i class="material-icons">desktop_mac</i>Top</router-link></li>
      <li class="divider"></li>
      <li><router-link to="/about"><i class="material-icons">accessibility</i>About</router-link></li>
      <li class="divider"></li>
      <li><router-link to="/caution"><i class="material-icons">info</i>Caution</router-link></li>
      <li class="divider"></li>
    </ul>
    <nav>
      <div class="nav-wrapper container">
        <a href="/" class="brand-logo right">Wikipedia Tree</a>
        <ul class="left hide-on-med-and-down">
          <li><router-link to="/">Top</router-link></li>
          <li><router-link to="/about">About</router-link></li>
          <li><router-link to="/caution">Caution</router-link></li>
        </ul>
        <ul class="left hide-on-large-only">
          <li>
            <a class="dropdown-button" href="#!" data-activates="dropdown">Menu
            <i class="material-icons left">munu</i>
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</template>