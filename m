Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6319E2D1936
	for <linux-doc@vger.kernel.org>; Fri, 31 Oct 2025 02:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761878141; cv=none; b=gKRhHo9MtLqdcDPx5b8ayUZTOOxNxyziPw7jw2F7FfyMCU/3uXTgslEHKCjjQyzDgi8M6MsjHfCM7003+fsfczt98aefkB+JjtXTpGETC33N/q7iURlwrf+gjV/9LO4F9t/z1ef6i/bUnAd8R7kM8Rdbci9K+L1EhwGQ2Td2jQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761878141; c=relaxed/simple;
	bh=08DR8ByIVln+RtqS/Cdj4+7tEMme3kgNEHW0emoY5+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NUE6L/hmDc9WR5amOBHrbeTOZanY5wQF4fO8dgulIEwnddCLWDddAQQS7OhFna8cR030nzwR2TRc9djNVG+ze95HbwEJghyPXa5rxaV16FEm1cbfk4SaEosilY3YxBtQLObG9o5fZTvsK2g2aQb9VMyKnqbLdxCME1Z50Nv7RQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TS4QkoE7; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TS4QkoE7"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29525e6d98bso2233005ad.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 19:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761878138; x=1762482938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9vvQRtDmKDzAuZGXq3vjR0AUmU7rFcWJ57hWGdXPzcg=;
        b=TS4QkoE7APzFUVmCahEfnSZWRwR6JQhMDRpxOuAg+MU43vug99Wgik81NH7CoZxcbE
         1+ype0LJaYumidkwUXo1uz/FEksOOJ5KKqLl8lO8Li/1ficXx7p5eZm2dPOptcN4Oi+v
         rFDz/IJCrCuLnL9R2hd5H75ddxF8DDda0WiSIU5AaWfBqwuHV1wsfFAJuwiOkgNM1OMG
         EeohUC2mZ5nj/dtB0f6xewdVvZ9Hy6b6nUG5ta4FZ7OQxZWAzwpU4/oa3kJE8S1rlecU
         URq0OhTonN+xmH33W4qCrkHMqtJCnOtW8o4JQywZz+kvwPkAeZ6Vv+oT/6NmUNQfyZRZ
         e2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761878138; x=1762482938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vvQRtDmKDzAuZGXq3vjR0AUmU7rFcWJ57hWGdXPzcg=;
        b=nm1iRuE4jhMSiLJi0zl8Jt52pcbCPxnigeYghZocw1r0AYdYxdgLyznR4lg4VF/ybJ
         8PafKmfZ1DFhjBuxb4w8GBauTbntz4Oo9DwixwqP0x6hU+V5RodJJDVahf7GRH/OxPNP
         O2mfT7E1ZX1AMHKZsLjevCLSuL9wysSFkjIy3FFUa46aZ9gZM9GkVv/Rc4MfCrtzpmwL
         sw6pBE8Cld2yilHCjVHnPgsIXjiGddInM/TMKxeDhMBwDn1rJWjbtzMNT4g43tw0l6at
         dpMjqXR/vN79rstcgs8c+TqYTbkxW6myQx2jO14a0dGmD88F9GHIkGZrgmmSUnOV01yL
         Zgsg==
X-Forwarded-Encrypted: i=1; AJvYcCUB10ZXuZLylZV1QTZlgNIQh/rVmRsv3MZujGq97HKW3/UjaSm4GiGj46COVb3gKblhEF8ebAqayd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDeGiTis8FgqVfQKkDz59ntJHXQ/Id3P8MuNV4KcxXhbIPX7Yd
	b34JGsD6Ix8dIp6ZII8E2y5l9nQgbWOxZuMjI0QDMRAAtxVBGZs4iEpJ
X-Gm-Gg: ASbGncu0DaexS7i5ckzo1gIUFUmJ6sp//LjDtn6bzt1IPs6thubVpDcK4Ed+doivZuW
	HBwzpZBbNO9DgjEUkPaQj9qBMuXK8iernVTPl9+T3P+C7z87eK9jiFejujPivD/cC5QphGX0MuN
	0g6bEhkFTJoWdSqXaVN48ScyRqvKvlDeSJGywCK5j1v2k/XhVc5e/vWWZdcTbSIAmFPXjpuA9JC
	MvhBjv48DGsztvGZADDwbJMe9uK98Ubv+s3fZrI5/pWyQNZcPI2UtRwIKUCNWJ4+B9w4s+eW7Ja
	buJ9xZDcv6k0iyrdqMH6bzkyvan16UcfL6Yk4rUNuTnSGhGRWC0uPhdr0wKSUR979p0Fkq3KOvT
	YAVubUL88Myk4t6i3k+DbKEPLt1uOg2HxUroixZi2WYtANOOpOxmXN/PaWBkOWxJnRkG8Ksj5c0
	Wn
X-Google-Smtp-Source: AGHT+IEluerJf1Yae3TPbqAUr6I78s2WydyYE9qOcEluGuH9xjTI40DkyWuxTHldqCEahsYNqzQsMA==
X-Received: by 2002:a17:902:d507:b0:263:3e96:8c1b with SMTP id d9443c01a7336-2951a55d380mr29699905ad.33.1761878138054;
        Thu, 30 Oct 2025 19:35:38 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29526871b31sm4626845ad.8.2025.10.30.19.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 19:35:37 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B11164209E4A; Fri, 31 Oct 2025 09:35:35 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] Documentation: gpu: Limit toctree depth
Date: Fri, 31 Oct 2025 09:35:21 +0700
Message-ID: <20251031023521.12391-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=725; i=bagasdotme@gmail.com; h=from:subject; bh=08DR8ByIVln+RtqS/Cdj4+7tEMme3kgNEHW0emoY5+w=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJksCgLnLxv9frYxp2KjjuGSCxotjKclP8/XbY+ae1bn+ G3OP3mTO0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCRqCsM/6z35a01+mzFKXTW o+DwgchOj70/2B6+T7gRvVkz3C5juxfDX8Gpd+LFf+vvO32pSHb/Q0E+tqht4rNEeY4xTFRzvfF hEjMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Currently, gpu docs toctree lists all headings across the documentation.
Don't spoil these details by limiting the toctree depth to 2.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/gpu/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index 7dcb15850afdb2..e6207b31f8dbd9 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -3,6 +3,7 @@ GPU Driver Developer's Guide
 ============================
 
 .. toctree::
+   :maxdepth: 2
 
    introduction
    drm-internals

base-commit: 6fb7f298883246e21f60f971065adcb789ae6eba
-- 
An old man doll... just what I always wanted! - Clara

