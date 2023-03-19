<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<nav id="sidebar" class="sidebar js-sidebar">
	<div class="sidebar-content js-simplebar" data-simplebar="init">
		<div class="simplebar-wrapper" style="margin: 0px;">
			<div class="simplebar-height-auto-observer-wrapper">
				<div class="simplebar-height-auto-observer"></div>
			</div>
			<div class="simplebar-mask">
				<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
					<div class="simplebar-content-wrapper" tabindex="0" role="region"
						aria-label="scrollable content"
						style="height: 100%; overflow: hidden;">
						<div class="simplebar-content" style="padding: 0px;">
							<a class="sidebar-brand" href="${pageContext.request.contextPath }/"><span
								class="align-middle">BlueMine</span>
							</a>

							<ul class="sidebar-nav">
								<li class="sidebar-header">MyHome</li>
								<li class="sidebar-item"><a class="sidebar-link" href="#">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round"
											class="feather feather-user align-middle">
											<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
											<circle cx="12" cy="7" r="4"></circle></svg> <span
										class="align-middle">Profile</span>
								</a></li>
								<li class="sidebar-item"><a class="sidebar-link" href="#">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round"
											class="feather feather-book align-middle">
											<path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
											<path
												d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
										<span class="align-middle">Kanban</span>
								</a></li>

								<li class="sidebar-header">Project</li>
								<li class="sidebar-item"><a class="sidebar-link" href="#">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round"
											class="feather feather-sliders align-middle">
											<line x1="4" y1="21" x2="4" y2="14"></line>
											<line x1="4" y1="10" x2="4" y2="3"></line>
											<line x1="12" y1="21" x2="12" y2="12"></line>
											<line x1="12" y1="8" x2="12" y2="3"></line>
											<line x1="20" y1="21" x2="20" y2="16"></line>
											<line x1="20" y1="12" x2="20" y2="3"></line>
											<line x1="1" y1="14" x2="7" y2="14"></line>
											<line x1="9" y1="8" x2="15" y2="8"></line>
											<line x1="17" y1="16" x2="23" y2="16"></line></svg> <span
										class="align-middle">Home</span>
								</a></li>
								<li class="sidebar-item"><a class="sidebar-link" href="#">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round"
											class="feather feather-grid align-middle">
											<rect x="3" y="3" width="7" height="7"></rect>
											<rect x="14" y="3" width="7" height="7"></rect>
											<rect x="14" y="14" width="7" height="7"></rect>
											<rect x="3" y="14" width="7" height="7"></rect></svg> <span
										class="align-middle">Cards</span>
								</a></li>
								<li class="sidebar-item"><a class="sidebar-link" href="#">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round"
											class="feather feather-align-left align-middle">
											<line x1="17" y1="10" x2="3" y2="10"></line>
											<line x1="21" y1="6" x2="3" y2="6"></line>
											<line x1="21" y1="14" x2="3" y2="14"></line>
											<line x1="17" y1="18" x2="3" y2="18"></line></svg> <span
										class="align-middle">Typography</span>
								</a></li>
								<li class="sidebar-item"><a class="sidebar-link" href="#">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round"
											class="feather feather-coffee align-middle">
											<path d="M18 8h1a4 4 0 0 1 0 8h-1"></path>
											<path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"></path>
											<line x1="6" y1="1" x2="6" y2="4"></line>
											<line x1="10" y1="1" x2="10" y2="4"></line>
											<line x1="14" y1="1" x2="14" y2="4"></line></svg> <span
										class="align-middle">Icons</span>
								</a></li>
							</ul>

							<div class="sidebar-cta">
								<div class="sidebar-cta-content">
									<strong class="d-inline-block mb-2">Upgrade to Pro</strong>
									<div class="mb-3 text-sm">Are you looking for more
										components? Check out our premium version.</div>
									<div class="d-grid">
										<a href="upgrade-to-pro.html" class="btn btn-primary">Upgrade
											to Pro</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="simplebar-placeholder"
				style="width: auto; height: 882px;"></div>
		</div>
		<div class="simplebar-track simplebar-horizontal"
			style="visibility: hidden;">
			<div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
		</div>
		<div class="simplebar-track simplebar-vertical"
			style="visibility: hidden;">
			<div class="simplebar-scrollbar" style="height: 0px; display: none;"></div>
		</div>
	</div>
</nav>