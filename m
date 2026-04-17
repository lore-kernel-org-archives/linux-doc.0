Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10E13B583C
	for <linux-doc@vger.kernel.org>; Fri, 17 Apr 2026 17:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776447403; cv=none; b=UxZJulhbmDfUYliNaWAq3VAoRZkjBS/zrvQDy5v2q6pGRpYuhSAyluhdS9VMcW81G4EYT6FIAC8/7jm0aL3lPgZVVRd03+LK20xCAfImX8bDsDPf6e80h+t5O1OsS+Sv2lGgN/CZYo3mZzi1sYuq9Lbpa0SN7XNw3VXJJmXldBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776447403; c=relaxed/simple;
	bh=jkTCGTx5N5kNDBuJiGd3cHBXCdOpLr+klCtenLR7CNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SLc6Qm2eVztnpXA8I6iyi5R3grwCdOQ0oxFS0pwntIuv4cmBtz3YUQQ+UBftkjuGvw4Of7KkPO8KM/j1CtQr00DTAx2/jnuMJMe5yFNFVJEbibxNe16pfJ/UFfeMwuJmJEDz0ZiDlCA7K8SjA40PzoeBu2m+DGxWwG+CFctgCuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KcTGVCcd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KcTGVCcd"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so6671595e9.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Apr 2026 10:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776447395; x=1777052195; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+okOEmaZb2t8QpikbjQlDiBfQLIdyz/gfflHu8dorl0=;
        b=KcTGVCcdtlg3nw8BAgXzEsc5FtsAAMV3C7qKTPbllVc50bZPgkchNGpistzh5gFoNi
         k+fQBhoK1hETiEaGuqarRehzUU3T8k9Cu2b5725SE8rR+j2KlmMMbcqq+dE8kKANqNu2
         RZWUjDwrMJi3CCU+4Y0WT1M2qNMQrixKQQFS7i2Y1xuNBjVgewOOg2faStB3xShBG05R
         bu79LnwQQXGt7anMWRDn8MVXpedXkALUUEEzWPzSjQd4Yomhveih+/Wn1LBXIHVECf7J
         XHtVPERW4BOLcKuJjFe/Mx3GQTlFDVC98BrCfZ+qqYmg84Yf9xQTkkroz+/q5ExUht63
         MCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776447395; x=1777052195;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+okOEmaZb2t8QpikbjQlDiBfQLIdyz/gfflHu8dorl0=;
        b=I7M3D7tECftoArzVFzqoBYlGVbMtVDeXDGrvSdgA0mEdBPtoNF87m2V5CyceR+wtC0
         aqrrZ3zLn9UeUi1gjS+7rekDuLP3QZkipO6HrLlJgHMgdSM1kimDJixjOy+ed0PelAyR
         y+bSfMBWm5QkHju0IJpU1f1cbTkWEoxrTPMkntMofjQbT8Q/mNgkdenYbJktLDXfopns
         MnnpZxH/8kmIDud54Nxkx/eBwg7VFxreRC0nA/54zSHU8mDLwnhl+GlswrU+Nx1IK2qj
         7JkWG3Hejr4HH2x7/5F41/sFrKR2VMF8YnSqL0FtJlPTjrBNjPfY2NFNP85IKoRaa2Go
         NPxQ==
X-Forwarded-Encrypted: i=1; AFNElJ89r52Pgik1k+UzjGfao7cvMN6b12kINRb2jJ1Tudb/r/GUp51N/JqReG0FIq3+muVoMmVjx4Qgy5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcDJLTPUca5DUAZ8Hz1XgiBg8RmShXS3a+Jg79Smr7Ijdf9lxU
	vt5MLmk8pKtTU7UciJ2dXIOr5Oci+qqvI8f9107jg25CPx07yTQYOzT4z7hiNWkOPNs=
X-Gm-Gg: AeBDiesR0XRqjHxXeaAOLJ05KAmCo/nJaXeZrmTrHkgvW4WXpawws3BSZ2S8GRdLgOK
	j+rhgr8HyONSS3nCYOKEKyu46xCvVVF9tHSJsVVbjP3jNM0MxXcLqMgqUcON0NjnhkonpRBcBsf
	iz2DU0qTRzTkbE0Mr1yblNMBClEAMCic7WxRlVdCU2P9eD0emJrO56hwfZhEAY13bMKDe0AlRcr
	YHgkMZp+2DJxf6XtzWLYX79SSuTQjpFf+Bzolup7uiYZvdeSU9ku1ymUj0T5S0qLwQ0EEUdOuIv
	JTMUdn50584oSU+xC5Sa8DMWA3tYCrrZ9X/Wtm6XohzRok+6rYwMCejwS7otf4eZMipMISBuL6H
	++MXXRqpUXeBfCuuoPxmAlcSBjor2JMUiv4yjOJHGOJJGEG32/+q1ADPvEuiFX4xtszE2qthtu/
	R/ts0r9Yi5Aqp0hy07MVGtAJ4=
X-Received: by 2002:a05:600c:888b:b0:488:c40b:c8bf with SMTP id 5b1f17b1804b1-488fb73d234mr44822655e9.2.1776447395380;
        Fri, 17 Apr 2026 10:36:35 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm3917884eec.8.2026.04.17.10.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 10:36:34 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 17 Apr 2026 14:36:28 -0300
Subject: [PATCH] docs: kselftest: Document the FORCE_TARGETS build variable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260417-selftests-docs-v1-1-32e4a78214eb@suse.com>
X-B4-Tracking: v=1; b=H4sIAJtv4mkC/yWMQQ7CIBREr9L8tURKGo1exbj4wCAYQw2fmiZN7
 y7o8k3mvY0EJUHoOmxU8EmS5txgPAzkIucHVPKNyWhz0tN4VoJXqJAqys9OVPBhwsUY9kZTk94
 FIa2/4O3+Z1nsE672Sn9YFihbOLvYJ4kLx2PGWmnfv4g8gcKPAAAA
X-Change-ID: 20260417-selftests-docs-fdf4e922ad20
To: Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1776447391; l=1836;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=jkTCGTx5N5kNDBuJiGd3cHBXCdOpLr+klCtenLR7CNE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGCdk+Dqytqm1mJBSK4cT3p4LBx+mdWpB8pQc8eyh2BrVstLyrEfAJ2T/V17tilHX0CXhRx/m1D
 RzaCl4kQSDw8=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

FORCE_TARGETS has been part of the kselftest build system for
some time but is absent from the developer documentation. Without
an entry here, users relying on kselftest in CI pipelines would
have to read the selftests Makefile directly to discover the
option.

A build that exits zero despite some targets failing can mask
real breakage and mislead automated systems into reporting
success. Add a dedicated section so that CI authors can easily
find and adopt FORCE_TARGETS=1 to turn such silent partial
failures into hard errors.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 Documentation/dev-tools/kselftest.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 18c2da67fae4..d7bfe320338c 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -126,6 +126,18 @@ dedicated skiplist::
 See the top-level tools/testing/selftests/Makefile for the list of all
 possible targets.
 
+Requiring all targets to build successfully
+===========================================
+
+By default, the build succeeds as long as at least one target builds
+without error. Set ``FORCE_TARGETS=1`` to instead require every target to
+build successfully; make will abort as soon as any target fails::
+
+  $ make -C tools/testing/selftests FORCE_TARGETS=1
+
+This applies to both the ``all`` and ``install`` targets and is useful in
+CI environments where a silent partial build would be misleading.
+
 Running the full range hotplug selftests
 ========================================
 

---
base-commit: 83ef26f911432d9c98b6d8b6ed0709a8b79cd834
change-id: 20260417-selftests-docs-fdf4e922ad20

Best regards,
--  
Ricardo B. Marlière <rbm@suse.com>

