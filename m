Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666FD4252C9
	for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2026 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750972; cv=none; b=rSq0gAy1bDI4+TPNT9b5j0ipZF2lA4kVXhD8EGYxTz/8JM3q8rO2l3WLbiwv0Xi/rsb8fwRcG70rpEGYziSzOcX741IUxTPnzX1NaQ7VRTB8cTj0nZIC0Iu/2MV29BH9/ZSJGUc22xUwiwmiRiqPx6DN+dXF1xNh6AjdXCulowk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750972; c=relaxed/simple;
	bh=NTBDsd7W8rqFMzsv0C8Igm3E34cVJOj3/zvqlQP38Fg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=d9LpdKi2+mFC0eWzghRazQyil2MPBkkqdiQmvFCbvfyMKHOHX/mSZCSdTAQQMHXE4MXTSeSDhPMZF9+g7sRb2kfpQ1MgU2WE66o5uRACaU6oG7VsDvDFEZowzRuEPuHlX0GeIQIj6vcg0tTqLkyiJ3fFjWLHtVZ+0ogZ9ZqEAAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qgnisj4z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/stY/VL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qgnisj4z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M/stY/VL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787750970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xSCrXzn8CAowsJ0tGBnOBBbCvQKgrZGEllzSa8e6M34=;
	b=Qgnisj4zsH/4u1zn70RWhyuDFnNoOY1CzFSNGiVwldNfHm8FJWwkFMFeowRv3McH7oPeEo
	ZivlelMUPS0A+YLVvXo5+rTeuBlEjEQFZXDi7N1EVNjU4rfs+48bRh/k+1Vba30j/ZqPJe
	aYL2UAhI/3kxLFSDF8Jxa+fE73SrCh4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-y-d86AnZNWaekx_N4bV7gA-1; Wed, 26 Aug 2026 09:29:28 -0400
X-MC-Unique: y-d86AnZNWaekx_N4bV7gA-1
X-Mimecast-MFC-AGG-ID: y-d86AnZNWaekx_N4bV7gA_1787750968
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c252c2ffeb8so56151266b.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2026 06:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787750968; x=1788355768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSCrXzn8CAowsJ0tGBnOBBbCvQKgrZGEllzSa8e6M34=;
        b=M/stY/VL8TE8mR6oVmJyf6ymn1K2BuI3dlonMC5tSg78lJVRtOti82jHQaN8Q//gIJ
         Vzvkt1C3DXIan7Lo9pPonXAiLrnDybfHxYN3QWZz/Hd4XAy260PkAt+ewADDq1almhOJ
         G1gofdIcgrTj+WKZ/fsUrO5ArUI8/Kqywpmxn3XBOUU1oxZMOiXIjT/2/I2EXmDTpH5y
         rBTniyHSt9xRFaDGWt9xH5gThjNAQOZJt3cyWRBdCW9QX8Bb8rB9JvXn+FqxE+3dR6j8
         tC6nIsvMpsblA5AQkM/QeUmH3CzPrSxwvvu9ownQyUL3lGb96fUlSw0aRgEBdi9OQ7Vm
         2nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750968; x=1788355768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xSCrXzn8CAowsJ0tGBnOBBbCvQKgrZGEllzSa8e6M34=;
        b=PNW4CYtm/XgbaagNYL7QjPWI+MGalf66ak55aEdL+WB39+njwuJpWCP/BRjzkMehQV
         5Yu3Oa1DLc4ED7Xe6MLWoTiQap6TmItmuwYOp4EHqSb2bM/Q23GPxnmVnjL7JcE96T1x
         QLB5GBLMCOkwCpwPV5MyzKgwJMXS319AUA+I9KHU0jbNDlzOoAjtjotoydbeCyVMICRD
         GK0JPwKKWNfsa77kAMyAW8GnzsHW0J34AsbFOqLEM0C2+unlUqoP16ixe/BpSFQ/y9Ez
         H5n/0QRd91cphWdBs+yxcLACN6NPvpObzsNJIQmu8ginsyWLTw/K7e+pUzti3WaaRSSJ
         9CKA==
X-Forwarded-Encrypted: i=1; AHgh+RrOLma7lNBUYpcoX09nbbauMYFLInFdg3PA+chQGQHue4yQuydzYMUP1u6CC51IhAAkUKzZUROP4bA=@vger.kernel.org
X-Gm-Message-State: AFuF++khDIK0tfYvbGyBFg17rRZTUuGFpoCM8kwU/5ns0I6QAnfealMU
	n6JJdyKL18dsbi896Sqai2dnpzqLGI8ZnLFnK6GmuVTDgSBa6KIZNKcGcLzKRGpHqy36eUAOyIF
	c5vTh76nkWKohzwiZtz5l5BlunKXZLsGEFc0iL0rXx4obNdah3wcou6NAh9nb/Q==
X-Gm-Gg: AR+sD12uyKVs0UtSrxD8cZfJ3f8Aj2nrlDozVVEuQxy/8xHJNKWuIvnlME23wpKgKRk
	tx8DPzyhjjrqcRhVUtCiDUg7rO/92GcjMxtql7bISGDN85bZy4IdHo5ldppNHFDeHmKuln1fDF3
	IIWLt/1HPAnaOlywqD74zS9W/R3SuP2fWNKDBnu1MNEUZxgs8XY5rNelDmis/xhQonhn0lYEnPV
	a1UWewM2U5c4aGBnNb1fnaglurFATD+iYZRDJtH/wDwD1xwjYv0uIoHWuVl18i2Lfnrn7+iNJ7e
	GK1PZ1iw6trOQq1OTn/GRGACCSY7LW6PgIkfX4XbYUTASyamowIyXdv7EE8zP3FEERcmtFCZwv6
	u/KepW/S56IpR/bqS
X-Received: by 2002:a17:907:1c17:b0:c24:4128:c19f with SMTP id a640c23a62f3a-c250c596866mr850285366b.11.1787750967733;
        Wed, 26 Aug 2026 06:29:27 -0700 (PDT)
X-Received: by 2002:a17:907:1c17:b0:c24:4128:c19f with SMTP id a640c23a62f3a-c250c596866mr850275766b.11.1787750967177;
        Wed, 26 Aug 2026 06:29:27 -0700 (PDT)
Received: from cshulyup.raanaii.csb ([2a00:a041:e223:1b00:cde9:6812:f4a4:646])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250dfd6e6asm387535066b.19.2026.08.26.06.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:29:26 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] docs: sysctl: timer_migration is for hrtimer only
Date: Wed, 26 Aug 2026 16:29:19 +0300
Message-ID: <20260826132921.294142-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit b2cf7507e1864 ("timers: Always queue timers on the local
CPU") __mod_timer() no longer depends on timers_migration_enabled.  Only
high-resolution timer migration from isolated to housekeeping CPUs
depends on it.

Update and clarify the documentation accordingly.

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index b6328cd0f43e..fb38d654846d 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1609,8 +1609,10 @@ If a value outside of this range is written to ``threads-max`` an
 timer_migration
 ===============
 
-When set to a non-zero value, attempt to migrate timers away from idle cpus to
-allow them to remain in low power states longer.
+When set to a non-zero value, attempt to migrate high-resolution timers from
+nohz isolated (nohz_full) to housekeeping CPUs.
+See Documentation/admin-guide/cpu-isolation.rst
+and Documentation/admin-guide/kernel-parameters.rst.
 
 Default is set (1).
 
-- 
2.55.0

