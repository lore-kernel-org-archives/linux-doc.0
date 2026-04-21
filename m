Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74D03D8103
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 20:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776803050; cv=none; b=oHO84oKYoncvNBjS7YrMUXN/SkZcuPdexMedMG6g/mNZ3KORPupVmMg5McfvwhJbu9KJrmCuM1Q8HVnjmIuNDq3GBLYq544bVGuRlI0aU3C09CQhEJun/UbUzhKapwzsr3mlCDoCU+wmKJ5uzUT5bb+4Tnqld/p5d65kRdxMruc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776803050; c=relaxed/simple;
	bh=Jlye14C712QdplGoRodEKGWzEzg32X0cVK6hR6vA/kQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mxkET5HHKWpLJxarUrK/Cu8JVN55/enDMJDsq4F8UXN7siQ4+7vPEnH6WVHJ9IHoBe7YHuAvn100imLHKerr3G7zFNZG+1rHnWeLv9btpYN6Mg9IBKOGuruFYUjO+F1eyqvcChk4Ib1Cf12t702ClaUd2CZg/RtaJUZ84xuGmi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PahTdiFP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PahTdiFP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48909558b3aso37731245e9.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 13:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803047; x=1777407847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tyq+WSIvSiZYRnXDISsoYSiwaAwPd9Py7g+QKilzzY=;
        b=PahTdiFPXJOD7Uk/JghLdr1AuieYvkB6yg5FM5DZUhovZvcvLRqnQqEq+kltSTgVkU
         4VhmU3/pel68geaSZf6exKC3MLyprVD3gw0KDCuCCUc2MYzVRNzIhqq69bgabAEmMLbT
         JIBGrZ1EbSsTtS5tBGEeuY9oOi87f1rt51bXA0FnEJgzADK1AoflLAi3xJ7VsUmbfY+C
         7m98jpeT8L4arNynXvKOgURTSU8Z8oR9X44IiMiEKIeRoqZdEFiYJjpBUYKholzDBZP8
         kwB/7ogiifsawleO6Ru+J3qAODT8HGAaUwY8+RGNxwyp6LMGZn+sxDWjAMIutawpDwQd
         CYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803047; x=1777407847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4tyq+WSIvSiZYRnXDISsoYSiwaAwPd9Py7g+QKilzzY=;
        b=MKL16I1gW+5I6UPeqx85rZi6WzK3+9aM9zB50Q460bz7jRx3Ae0pHhkeHWUKp8pUIi
         mFPkLnSM0pycDwn6agShsbdMt0q+iobnaCnR9nleXZ+WpnOe9un/JdHKZK2wHqJteamQ
         wOErpNmElzqYWoAXwFBQlzqQHSAFpgLnudQ8alvc+/EJiNLyflfsr4y3LWiXAEVOoiq2
         sNwg3sb6fvurQkhNI7Nh7Nn87hXo9xWDytD8TWjpHUbNPEmApgBzv+HAIAeq19DtjIXO
         hEZ3pfHaxWu1FbkTKVXQcs0Kpbw/w9TQ63P5745JEjIxjzfHdidnSEjmnIPeXe27LarI
         DhSg==
X-Gm-Message-State: AOJu0YzRrzII5tfQEn8GEow3hIK8CVsOqetuv0NT2qccydtxKEJM4WE3
	66S83YxGQt4S+tZaM82XWvZLx5pvw9f15uLQrFBz4TvCUt/F/N5sb6vO
X-Gm-Gg: AeBDietChABhmrOKFgcwudUaQDX5vkG2T4MTJndoV7Aned9u6D7olq5IjQBw7LeObpJ
	Y4eucRFamBl5NZ2hhZTSNLVzB0EhTG6WR2FqtrC5Idg0Ca1SsFWbJK+0d5/TpjTJ0chxqFPcIc+
	PdWAOmEmycY/TepGC8PqsBqSodU3gPf/7P2DTU2QR3IaQMTqzLw0tbeU0zzV4jc6BMAHPUWz0hc
	hdcHRAgCBv17DQIxxA9VRSKvFrU1k2in8z0eUU9SCqY1p8imkq6E58rewAUahPzn8F4VeMF7u6C
	Siq0RS6AuLktyJasv0AJcxIAMjzjC2ai8Txn3+YGkFOwF2bp41CJzNOyABaA3DFNVMI2MPwBbxW
	jQ9TFVKxyhLdnbSb3273j2liR1RhW/LqjGZAppsIXD/PQ3aPnQf/dczBVyDiXWMC/gu041nouiH
	7ZaQubWe+eYHMIs47RYi3monzrjdtKnEk0ssvuGsQ3iwGp
X-Received: by 2002:a05:600c:c4a1:b0:488:c014:34da with SMTP id 5b1f17b1804b1-488fb77ed1bmr266248505e9.26.1776803046853;
        Tue, 21 Apr 2026 13:24:06 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:24:06 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 21 Apr 2026 23:23:10 +0300
Subject: [PATCH v5 2/8] dt-bindings: arm: Add zx297520v3 board binding
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-send-v5-2-ace038e63515@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-0-ace038e63515@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1772;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=Jlye14C712QdplGoRodEKGWzEzg32X0cVK6hR6vA/kQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zXs1flcrAYTX8A8SSVmUw46VloONu4/yzoj
 DU2Ro3rJ+GJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJ0fg//dan3zyJHker3j2oB+GnI8v2RR/pj3Bb
 M5nD3DtLV7EeicFtPfD1AybCXLNNTvgSpI3LWEA3VdqjVb0GXv04GNe1nLfIfH+3uo0BAxuvsHb
 IF7eVJXsZPdQN+0CcUJbcLqPJdvCTF64DtM/fIzMROPOal5Fd6/swYwhiZ6bzxgWg/cN40LXUV/
 CuX2z2626rg54WbMYq2bjPLaU4L8dOK8Ud+I2/9amJ7xYCzgshcgR1A3N31wdG8M1OQfrW+vStt
 5sdry84nsSzwAw4/EXryotOg0OwhZH2jLPhSTEfAiM6X8Uj16EGgaZg1k53ulcVQznOV1fK9ZkJ
 KUBnbuMTTcOwNSgg+q8Nk8H1i0nKktEKOIpDnuYYbUxVb4MVdzV06O+L1sVXPg6WcqtcUkVLLQf
 JJka3ti1qfZgxGYSZEyzleI13ZioREx6LM0eAzWPPfe2H8s07+TuCuAKxLnNKnN/ou59pxg1o6q
 bpTqL7KEpHPJHc94tHlwT/+Yn1/9sWJAH63fNcvm9Gn0NToAXNeYruFat/PLb0X2NNCHnN0j+QA
 4zDEio5Z6xql+gm7sBmCMDQCgs+QyAP9C13DA2Oc/NUmJwkZGoTTpq0jxa6B+kzOX6pk18QqiCm
 K6izx/bEVkn3dCRPz8nhBw5ONrHoB0z07pw09GX/yd0a/n8Etjcg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Add a compatible for boards based on the ZTE zx297520v3 SoC.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

The list of devices is the devices I have access to for testing. There
are many more devices based on this board and it is not always easy to
identify them. Often they are sold without any branding ("4G home
router") or with mobile carrier branding.
---
 Documentation/devicetree/bindings/arm/zte.yaml | 25 +++++++++++++++++++++++++
 MAINTAINERS                                    |  1 +
 2 files changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/zte.yaml b/Documentation/devicetree/bindings/arm/zte.yaml
new file mode 100644
index 000000000000..4b0d6d53402b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/zte.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/zte.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx29
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+properties:
+  $nodename:
+    const: "/"
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - dlink,dwr932m
+              - hgsd,r310
+              - tecno,tr118
+              - zte,k10
+          - const: zte,zx297520v3
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 974d7a98956a..bcade90ca14e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29202,6 +29202,7 @@ F:	tools/testing/selftests/cgroup/test_zswap.c
 
 ZX29
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
+F:	Documentation/devicetree/bindings/arm/zte.yaml
 F:	arch/arm/mach-zte/
 
 SENARYTECH AUDIO CODEC DRIVER

-- 
2.53.0

