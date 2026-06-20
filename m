Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F258322D7B9
	for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 20:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781986653; cv=none; b=OqAoOl7UFGHGBsdvwazm3macG+vqUS5z9W3tA2c7/6Qo4vh3oChC0OpClsSqswDbn0EB0x/gWcLjnwajFUEoAFjvEMlqMD94+dAmS2Ot2cEXrtSm57RPjEJbXtlp0jKTYGoBFwm51ExOySZFOOJkj2f6c7w6LBizJIzgi8L7phc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781986653; c=relaxed/simple;
	bh=fDCFrf3ey1Tb10UufhoMb9Qf+gcO8zU8+mdg8cYOTjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fCmxvd4xjrsHsQ2tBWnurZe245/Q0FKiBtuBHNk4zlLNOxgNIyt5lnNKb2CWz+ZsLT/akFhi2tdTJYQ/Ai740AubNfD0K6VgD/7gyTdmL4FZLksIZZIdPU/x/h3zy/FXMjyQJ8SLeM38DQaxUt5yNPgT8XOkJXG6aCmP43fY5Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me; spf=pass smtp.mailfrom=rcpassos.me; dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b=CIt57S4X; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=gtq0B14m; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b="CIt57S4X";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="gtq0B14m"
DKIM-Signature: a=rsa-sha256; b=CIt57S4XcAT/O14mvE4u5STcUroQdpaT0+h5543wUpIOMFgdb+/1kIZunGoEmBiqoJW46G5OD7Oww7UXsC/HGNpkyO+4Uyn5rkI1aIOD8pWtbw6GFUodZK5ttDL3qJ/nyIoZbstOalGkd483xEurYrTwIriE/PPCR3Yeb3SzKMV+RdRVZd3hS/qWrMSje2LARkPGOUHvemqS79shtGir4+VIj7Za+YS4Fh9L9p8wrqDiLqDNY086J1eA1x8I8uNdpXH9qs28JHnOn7mEgtgK9zkXVNvr7PPjVGkWC6lAsGGTI6C09yVnTOs1TCRGIWIYrzx6uChu+UeHtiZW+TaBEg==; s=purelymail1; d=rcpassos.me; v=1; bh=fDCFrf3ey1Tb10UufhoMb9Qf+gcO8zU8+mdg8cYOTjQ=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=gtq0B14mucXuvbZh0hvZsHdh2UleqhBRP5YyNQ/Clq7bY7fjokrcVaj6yD5YBcqYJCgLJA4RMOG2p/9LE3YaedNRiJ/g5H0QzB4UA52kmSB15FpxodwQDU4IR9hH/DalCSueiKh0SIs87TV3FB7fXz44LDsX34GAp2u7FoVWHw816vZase9C2CHAgdL4DrHHnkojmNzmsg5NQJAOk93kNswVzpWbBXHlIuZQtQKHzyktd91OupStfRagwVhr7tqU+Qev6Agr7m8I+MXy1WNMdMaKi6OLFgBJc1K6pXtJ8NozA9xxyVAdxguXAd2zVc0pddJs+aBPpfXrOuXA6G9z1A==; s=purelymail1; d=purelymail.com; v=1; bh=fDCFrf3ey1Tb10UufhoMb9Qf+gcO8zU8+mdg8cYOTjQ=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: linux-doc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1982731664;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Jun 2026 20:17:30 +0000 (UTC)
From: Rafael Passos <rafael@rcpassos.me>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org
Subject: [PATCH 2/3] Documentation: xe_drm: fix chars used for subsection
Date: Sat, 20 Jun 2026 17:16:34 -0300
Message-ID: <20260620201732.94141-3-rafael@rcpassos.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260620201732.94141-1-rafael@rcpassos.me>
References: <20260620201732.94141-1-rafael@rcpassos.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Equal signs are reserved for document tiles"=3D"
this file docs gets imported by driver-uapi.rst,
and the page title is defined there.

Signed-off-by: Rafael Passos <rafael@rcpassos.me>
---
 include/uapi/drm/xe_drm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 48e9f1fdb78d..4dfb30e6c8a8 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2537,21 +2537,21 @@ struct drm_xe_exec_queue_set_property {
  * Refer to Documentation/netlink/specs/drm_ras.yaml for complete interfac=
e specification.
  *
  * Node Registration
- * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ * -----------------
  *
  * The driver registers DRM RAS nodes for each error severity level.
  * enum drm_xe_ras_error_severity defines the node-id, while DRM_XE_RAS_ER=
ROR_SEVERITY_NAMES maps
  * node-id to node-name.
  *
  * Error Classification
- * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ * --------------------
  *
  * Each node contains a list of error counters. Each error is identified b=
y a error-id and
  * an error-name. enum drm_xe_ras_error_component defines the error-id, wh=
ile
  * DRM_XE_RAS_ERROR_COMPONENT_NAMES maps error-id to error-name.
  *
  * User Interface
- * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ * --------------
  *
  * To retrieve error values of a error counter, userspace applications sho=
uld
  * follow the below steps:
--=20
2.53.0

