Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7E8345CC3
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 09:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772789382; cv=none; b=cpjfDZ72vvKbZ6b87gIAzg+ic/ZUF1UWm2eqkH24OJyMk96SwSg0FQTkYKUgrouJCmCnCz/IUjEaZyoLo8RuNnC2bKr+tcWVleoQ4O6KRLzRMHR/oyrebDFw9LHFaxIS+hH1mWuwjGfQfyysmg/h7fZRjGIGkT+oYJx8m8tvvBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772789382; c=relaxed/simple;
	bh=YJNhliH5mDyNmZ3Uu8qu771SyOYHVYt940VTRvNI4yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tgXN7TMFTFXXS0HUyS/bzmPXtB0sX2InLu8/vbAjnyiYcMROsNQ7fD0GkhWdWBphm5g8a4m20n4lBeoIcmw+bWwDQQV27IvFWkMTw28k3kJ9i2DtMTK/r49UA36iJVuKrR3wBtQcftiqF+tcFMD/0e07EIKAvKMg9msNplPJ5qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rm1q3EY4; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rm1q3EY4"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-660f1a1e977so3227898a12.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 01:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772789380; x=1773394180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seZ2v6Zztz5cdfyw5k6l6tZogyzOdhCkgzc4DJO4PEE=;
        b=Rm1q3EY4z+uJSbJdx94xIufLlpYCMG/lL7+w/KKrHixG6Cw+EFhgfTC2TUNHPyc54D
         MbsIeJUI15xrgMTwm1zDZnrzPZ91yPCej+EVDlyKvJ3BXtygxq+TbT90zWf4iyHsm6qS
         uRsOVY//Fa0ZZbkYHEd2+2Nu4cG5EhsekJxI9EQr9R2VW8SD/5buhe3yfk4IUgjzUZJh
         NRhDaSW4TyAmqVu8ay37mfIr6AsAV/QjV9CGEX1pMwVBrYojvTlLxiAdOb2USGcqrL5b
         vqNr3MoHOFq3v1WLPr212WbkJNmxe9mvmFaiVDC5qagnQ4N5SDscl8TX4JWKA817Z+nr
         iLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772789380; x=1773394180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=seZ2v6Zztz5cdfyw5k6l6tZogyzOdhCkgzc4DJO4PEE=;
        b=icCPbqWzxVA+YEbb2Cvpub2N2KoZSAVe0HQ/6hfu0ZlYfMKjOsO9y4HbNJBE2i2ve9
         YGzWMRGa2JMusvXLnXnhjVPlp1GS6cE8CWAHR2CmL3X88ZwrLq2D9xbdQrhosmiI4ycV
         ouKkNz9yQl5E1HCnnGGmxI3SYNIkpgbGgslwds97EEE5LSV8+Pzfitm9yD7umOaRdLPx
         jf5fTYr1mfn4eXM+n61k+iYdwr2b3krqvcK3QhAbyVtBJ3UOw9g7Y4fHU6jP3McAqUgG
         I9JU26avt1K98F/ZS3GP1LAJnvNuAmQZDg1iQJa20V106SRonC8W2LD5GQjNXfzkPVSY
         IQiw==
X-Forwarded-Encrypted: i=1; AJvYcCXRIKaewyv37kRLjxj2sLxKmtZ7cx4btCvR7o+2NBeA1v34NJ56XvP0/Vs/j0zFyFRskzdz41W6CTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8vL6+pxDQN1agLa+lLVo0Qr4yZQ6nbip1zp33Cc7tjL7czjsy
	tqEURnDfVBlf1UvuVAocSkWo14XXvl8ZpJDtSyLBqkilV4GvmIjhb36cqPjY43OK3h0=
X-Gm-Gg: ATEYQzwkFdF9COUCE1BtRCGT5rSqIt9t7Dp6l/1T7lU1mOPPtck0yOiGJoFmj4yOcXb
	HVDgEZQ5HFlnM9mKQPRCcVZ6ghpoGWJm98zOHQVA0dQ5mBYjofXUNbhY5lRz6nPKAYuL7sbC8nN
	05LY2NpYZuE5vM88lA5jQkgf5RnfQ7Bs8yvjKnw/3/4Z6KqK8D+zahqpkJH9ieWMFKr4Sv1RwiE
	Lt485+MUiv2Um6ZVfIQmoKKgao0meaL78vNtZh54cJtgxKyeIaMwfMztE+hm1mZegS8ajafTInG
	SGaaatwiqoiDq6/OWGtAQH5rk8+q5haxMPFAnjYPLnGYSFeSGT0bVM04um3SX/5uXYsNMNPClu0
	9OvTLcxNvFkbm1dIAIRfA4GThOeJRWK4me14KZrC3bE+BBVryQwH81yWjfX7fvBql2Ppe8fHjjW
	fZreDz8dIEoFeYvXqhe9IWJuAEIKR96p9s3ZUEpzKxbnKCMHKviSgKteSMKaKesLJKBM571sY+Q
	4HOzxFzYPH+0qcMivX1xjMNZooarOKL33ma6lYfzIKhZe2+Ekbj6iE2YQ==
X-Received: by 2002:a05:6402:5209:b0:65c:2377:3344 with SMTP id 4fb4d7f45d1cf-6619d54b1a1mr755276a12.25.1772789379944;
        Fri, 06 Mar 2026 01:29:39 -0800 (PST)
Received: from localhost.localdomain (84-24-131-219.cable.dynamic.v4.ziggo.nl. [84.24.131.219])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a4fd5e87sm307163a12.18.2026.03.06.01.29.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Mar 2026 01:29:39 -0800 (PST)
From: MikaelRothig <mrrothig@gmail.com>
To: corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	MikaelRothig <mrrothig@gmail.com>
Subject: [PATCH 3/3] docs/gpu: fix typo 'complection' -> 'completion' in todo.rst
Date: Fri,  6 Mar 2026 10:28:22 +0100
Message-ID: <20260306092822.48393-3-mrrothig@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260306092822.48393-1-mrrothig@gmail.com>
References: <20260306092822.48393-1-mrrothig@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 Documentation/gpu/todo.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 4de61d19ecc6..686a94bead07 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -882,7 +882,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.
-- 
2.49.0

