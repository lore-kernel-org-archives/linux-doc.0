Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699062;
	b=juFmKSR3N2VnEMWvDVYlqFk/fUn5lIrHEhlJLmWAHFb23g+tr6aLdvzTBC6H/hplF/Pd
	 faZr7YldqYROS2Kri5FlJpUtpvnYdOd9fXVeFOuOQALXc4tBk/kOrIltIT1419788qjr1
	 eCni/AW+ta+ztZETefgcYdjfiGbHkvXmcJINrDShDNjfs7wA6FAYt108HbyTPqOfPiQCv
	 x2h4g0GAL2J9YoL2nW04oqFWO0jiDTnbJnFQMcgASysWl8QNyXog6sI5tRsfwcs1cPBQw
	 q7tnn+qobVDT0Wu9jA1DkhkXLhO05zBOF9Ae8viU4bqksGai+ciPl0dKpA9Z/yeFXpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eIolNKpjbc4RYfEkJstUlCqagpZzn46CDvq+iobq3B4=;
	b=S4l4DldB05+2jR2MX7vUZOzlYoGt/YukUtacJR+by5kdEO/YlAugFNinL82hGTOFogXQ
	 d4Wd7NeRFwMeZ/+TW1rCzOFjop6cd9uvPoabqK/L7Tl0CeboibB8ygU42kK001gQAkZJg
	 +IU21l0Y0tTPIDhGGqN7Yhyn5GwUW07dUhVTzVR/1pVh0biROTFe4YQH0l5CHFdpGm2Gi
	 JvWityIAxnOcHHpd65EUPMDMHsnqGLb9oCc5BOQTkjRGIhFzk5NCnuSBGXjjtaLuwAk1M
	 eqYj3jeMczWoZepJ0hwIJi5TcJdQPCMt9+AdE6mYcGoANnp9k2SlBD0asAl8O3Kw71g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DArpoPKf;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619F5606A32E
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 09:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 619F5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DArpoPKf
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dc1508191so600424f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 01:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699061; x=1794303861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIolNKpjbc4RYfEkJstUlCqagpZzn46CDvq+iobq3B4=;
        b=DArpoPKf5xoeQIv1aNscCTXIGhjfLj/yxs8DzuAyyrL0HLsOm5EbVJLNYVjNzVts5c
         bL+XE6S2CfIAJYsLXppv4W1u7AZEqdvT4Vad3h/JtSo+6E91VCwWwhBtQZjWPF94xel6
         UFqawneEUqW9T4M/muDJmMkJM8nox/12rz8QtfjJmvsYItg/cpJDGpBkH/Isaj2/E4QV
         HIa8mWqBVMcN9OFvEHW+LBBtiu30wU8ZRL3dTwbTI6aLfW8O9Poc/PtGdL0W2uivhdP7
         7S5kTZCOvHFxbPPKg3Jw6AIrrfRdWAj5eY9YeCJK142Lyp1e/Q3gMGNB2VOIMoJRZVoK
         yBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699061; x=1794303861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIolNKpjbc4RYfEkJstUlCqagpZzn46CDvq+iobq3B4=;
        b=kdLwroU1i2Um1QsaTMi6FTBJRMOKkHziyqQKm4nTmMp034nZMB1Kz7/+lR2XA+CaLZ
         fI0+99fQUHGhYY8SJlDKyyBEBG30bdkSgehKSYIYvzH51YJ1XlprnCzLsmKubnZphz5E
         mKL8mrhGymtMJfvFqdSElD0xUW3QloxsCjYXkTGG1f3X4O9ugazsA9BPYHh2tmtd2YC4
         f5E5DNoAXgXnEKCyCea6dQDbv1D+aUE7xPmjTqsRqUPadAWFMJuM1IpvS+g9tsDyfvO7
         Rnb8x011/AArxQ6FGekiZ4rPWxGREqqJ2T2sxf8225qp2oCwPkYPLJLDAZ+0zoTkgbFn
         QQGQ==
X-Forwarded-Encrypted: i=1; AKwUvBydRxeFvxnx7gk5AL832C1g9vCgr0Pimk9ciHUypsGBJ4CgT3CKw7ImhdhXi1Qt/u8vKNaYz85O9QM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MLGcjSNcwb2rcbHTvxSoENtECbiAnCAInqZx/c9SSvt5weH1r
	WXbbg5oMBa2OAiK0sUWQ56JWroyO+L9pb5d0KNOenif0DgMkUxut+825Ehl58y8FVAg=
X-Gm-Gg: AYBFou3uM3N5TsZWN3HGcoyqFHDIlsgvij0fpSTnqZV45jdr11eTgCgntNd3UWjlzdh
	1TUby0l1OK5Fn+7q/NJCR3GzWlWwqM8Jd5jU7h5uoXlj4s2Jk/jgAysCC0gy4XNVi1tQPdw3hyW
	SsAADe6NEDQL1E8HNMb6A99XlGB7EWmb0PjcWG7JqZv8YOcKPXqhfRXVwyQeFjRTmdprbMIG0Uv
	SBmIVvYmFCeRY0YqzBE4vgaADT7TMon1M7IeFYBb4MV89+jvjfL6VZ5REr9guU5w/0FagNt8k0X
	mIhgZbWUbBR5h0iIEV01qfjpZcrn7E4UBA0YcfZ4Ngdb9U5ekuiGCXaOu3Tk8CTiTcb+TykQkeQ
	JV3mOa1s5mw8QwYaNIjMJwQhyK78rPykWDthAj2JLBSNAEDRnslhpRTBw/73jxW9Aq3/5NgPBxb
	yS9z3E076W4n4UxrgHs6KGSF6GMHltCirG5O+BcOgkFAP7OaM3+lSgI8o10gG7rosGRNk+QtdCc
	wzVLu/GAlwx1EDKycLwIyjQiRX70xFaS4XfV8eqimxc7GYeB8Zdc77rENkuRuCtLhr2vTLWGwVk
	qrHCz41SdTDgeaKri/k/a26L1VKVWTTa/qlfkwFQsDx1mCYb4ReFbah2GcUIQLd0s3Am4Q==
X-Received: by 2002:a05:6000:4006:b0:48e:28f2:64ea with SMTP id ffacd0b85a97d-48e6e30088amr33275987f8f.4.1793699060575;
        Tue, 03 Nov 2026 01:44:20 -0800 (PST)
Received: from HIT (92-247-231-33.spectrumnet.bg. [92.247.231.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e88876946sm5226314f8f.5.2026.11.03.01.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:44:19 -0800 (PST)
From: Viacheslav Shevchuk <slavik.a.shevchuk@gmail.com>
To: miklos@szeredi.hu
Cc: corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	fuse-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Viacheslav Shevchuk <slavik.a.shevchuk@gmail.com>
Subject: [PATCH] docs: fuse: fix typos in fuse-caches.rst
Date: Tue,  3 Nov 2026 11:44:07 +0200
Message-ID: <20261103094407.912-1-slavik.a.shevchuk@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.1
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two misspellings of "successfully" and change "then next time"
to "the next time".

The misspellings were found with the help of an AI coding assistant
(Claude Opus 5.5) by grepping Documentation/ for the entries in
scripts/spelling.txt.

Signed-off-by: Viacheslav Shevchuk <slavik.a.shevchuk@gmail.com>
---
 Documentation/filesystems/fuse/fuse-caches.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentation/filesystems/fuse/fuse-caches.rst
index 0778dd3d..d19592c6 100644
--- a/Documentation/filesystems/fuse/fuse-caches.rst
+++ b/Documentation/filesystems/fuse/fuse-caches.rst
@@ -156,11 +156,11 @@ in several occasions:
 
 - When a new file system object is created (e.g. ``FUSE_CREATE``,
   ``FUSE_MKDIR``, etc).
-- When a lookup is sucessfully performed.
-- When a dentry is sucessfully revalidated (``->d_revalidate()``).
+- When a lookup is successfully performed.
+- When a dentry is successfully revalidated (``->d_revalidate()``).
 
 A dentry expiry time can be set to 0, indicating that it is stale. This means
-that a ``FUSE_LOOKUP`` will be sent to user-space then next time it needs to be
+that a ``FUSE_LOOKUP`` will be sent to user-space the next time it needs to be
 looked up. It can be set to 0 in several occasions:
 
 - When the user-space FUSE server explicitly requests a dentry to be invalidated
-- 
2.56.0.windows.1

