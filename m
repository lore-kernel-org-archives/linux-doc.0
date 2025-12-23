Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2227A2D94A9
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766488351; cv=none; b=M1xAhBbx70588YuL+uPg8S5mOmnHehqWxpHNRb/jV8qaFxUaGOOOHG2vh6jKZv5ZFS3/c9z9t1Tf9JisJsAg6KBaHru4FX9keDlW7IPeVN44uyiiSac8CzABjJHUytvpQQ8UbAN+g3FskCub5c5ZIoanblBc2yfkI6QtFpVYuRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766488351; c=relaxed/simple;
	bh=MTughzdYCPWmvb1BFm2WLRVRyodueaJ/0ozLV/k1/Ig=;
	h=Message-ID:Date:MIME-Version:From:Subject:References:To:Cc:
	 In-Reply-To:Content-Type; b=RJXfPM7pUkC8askneT7SekjUZk1qTLUiA17TJEAVMSK7sG1yG74QuqMKm3JC6byX1OXGJ3gnhXpceo8mrNj+HqfUX2/uBNaFvvU82Fi1k6y/NWUcqkLWc5NFIhE12YYnonz5IsW60zzGlkZN8Nd7UU23346m1EinhtVsobeGSc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJK8eaeE; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJK8eaeE"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37b495ce059so35962031fa.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 03:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766488347; x=1767093147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:to:content-language
         :references:subject:from:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Yz77BKulj8P2HmOrdWFfczwPQXLPCwYGoaL+ic0ul7g=;
        b=jJK8eaeEOmOnMrHc8AbX395jDUcUAzC9y9WhU1XF57mwG9e3BFWdzBBUk47wt2Cymv
         TngGnGt0tz4Wuq6SloKZGVzB9TxsCZR+/uO4YhsMcxLCAQrKWl32lDR4+qda/ZsvCC3f
         IpPywXGQ/uhf0ThOzuBshApgczB4MOBaGD8WYByEJnFliM+TD7OOw+r3qsrdxw029C7j
         a1boT77sf2tt7K6Nujxb+FsAmpjFAA3zGLP1VUEFpfUz2J8jRRuUZ0KcHQbvzrC+Lniu
         8oSsgH/cCnfxt2Zf5c94BLvmM4k8EcjoKxDB1TD7YAnWCt5V363EcFrTAAnHigWOV/2j
         HbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766488347; x=1767093147;
        h=content-transfer-encoding:in-reply-to:cc:to:content-language
         :references:subject:from:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yz77BKulj8P2HmOrdWFfczwPQXLPCwYGoaL+ic0ul7g=;
        b=NetNWxuoy1VzjqAgTkg7ak4TDw1cJzv8YKTHNKa61F6T7RltNfBjy7OPLF0pa3PV8o
         +5mGBKViMjJRQ0CjZOsyT4OnBrFdSNl2u0IZYSHyGaZ2vv3C7PSZ0oUSTyYyTmO8ArRi
         CfEhAur38TufwRdVnWsz2JNT7s8VXsuBM7rMv1GUXehqo8AThP01M6bKpL6HxYG+iZeI
         JMZoJkxcI/D0ImoyMgIG98CquzaakTJDi0kI6ZYWFxQOhYl6y7r9N834VcZiY6MAqkI2
         XdDuEQRaBdk/BlVmqUsbUEFcBpNwrzPvpkbMZPmhhpuOP39K95on6NysxpdVawf0KVyF
         ulCA==
X-Gm-Message-State: AOJu0YwGc+qxvJwWBUTBBM2pBx+lVHy6BYousqlHywvGs0ogARzWrzC+
	BMDYwe7oTsVfOlbQYcurEVrqTteO8tJx34w5QzzpQhvo+8wHUqKSSRZBYqJ9tA==
X-Gm-Gg: AY/fxX72WokehDFoUEE9XG/NV5OgZTemmkgGDJt4+lCXnbQOrDIJCX2TQ0UdH1NbVp3
	P8/KAPFgR4+m+b3SjhKZO0Xb9jDCqsHOjP3E1X2+MOc5f8aV3W1JmvIh33E3Ik7AOqgwE7cCwb9
	uJN5P69MCV2e4FUlm8szxriS4GtX+8Nmnb0uv+urn2PvTT1uotYxvJznilgyAgnLq0cBgbD9k5e
	Vh5qgL6JmGY0lDTja3EeSJRBXApeBBrAWuRaiXJeNN7DOANqYJlQHX3Whhz00ZMTq3voMkEnFFD
	Yqj0hVqLf7V6JZH/lXg2TrVgeIHTnYJfIcMuseZ0fMPmc4EBvUWB0UdeVYLezsiPogCfZOaWjt3
	FxZ5YSoIO7E+8LIcLOlQgbnI0h6MS7DY5vclZbxCr8Rl1T7aaApyrk2JjvnNc6nzqpxyH391fe+
	ZOK+NJLfD6GkUvpxFQg9yrf2PMU6M4XLyXeVLQmpscTSy1
X-Google-Smtp-Source: AGHT+IFPjxkx09p9xltIC+smPShAAcjpFUia8r4jhA69feWpo2eZZ1Mke9zvuUu1b0yx44kEEpiz0A==
X-Received: by 2002:a05:651c:19a1:b0:37f:825c:dcc0 with SMTP id 38308e7fff4ca-3812167e6f4mr40591611fa.44.1766488346835;
        Tue, 23 Dec 2025 03:12:26 -0800 (PST)
Received: from [192.168.1.149] (nat-0-0.nsk.sibset.net. [5.44.169.188])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-381224de761sm35657941fa.1.2025.12.23.03.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 03:12:25 -0800 (PST)
Sender: Maxim Nikulin <m.a.nikulin@gmail.com>
Message-ID: <f5c3f6e9-cd92-47e3-89c3-06dbcfc98c17@gmail.com>
Date: Tue, 23 Dec 2025 18:12:23 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Max Nikulin <manikulin@gmail.com>
Subject: [PATCH v3] docs: admin: devices: remove /dev/cdwriter
References: <87jyye18n2.fsf@trenco.lwn.net>
Content-Language: en-US, ru-RU
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87jyye18n2.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Remove /dev/cdwriter from the local symlinks table and from the related
note.

Creation of the symlink was removed from udev in commit [1] that
became a part of release 115 in 2007 [2].

The altered text was added in 1995 [3].

[1] https://git.kernel.org/pub/scm/linux/hotplug/udev.git/commit/?id=b1a2b83f2d
    2007-08-11 14:06:03 +0200 Kay Sievers.
    rules: update Fedora rules

[2] https://git.kernel.org/pub/scm/linux/hotplug/udev.git/commit/?h=7e599863919
    2007-08-24 01:29:54 +0200 Kay Sievers.
    release 115

[3] https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/diff/Documentation/devices.txt?h=v2.5.45&id=6e995ea941a
    1995-11-21 Linus Torvalds.
    Import 1.3.43

Signed-off-by: Max Nikulin <manikulin@gmail.com>

---

Patch set v3 (second revision of this patch) changes:
- do not add comment when cdwriter was removed from udev,
- adjust commit message accordingly.

Despite in this particular case I disagree with

Jonathan Corbet Mon, 22 Dec 2025 14:58:25 -0700 wrote:
> As a general rule, kernel documentation should describe the kernel we
> have now; if we try to fill it with all of the history of what once was,
> the end result will not be pleasing.

- The note was related to recommendations to other projects rather than
  documenting kernel.
- The obsolete recommendation was here for too long time, so it is
  better to keep the reason to change for some period of time.
  It may help to those who seen "cdwriter" earlier and now they may be
  confused.  On the other hand the change is minor and there is no point
  to prominently advertise it.
- Git history is incomplete making "git blame" game not so trivial.

> So can I get a version just
> removing the obsolete material?

Earlier I added the following exactly for this case.  The change is
minor, so alternative commit may save some time.

> > I wouldn't mind if you discard this patch and to commit another one
> > with better wording instead.
---
 Documentation/admin-guide/devices.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/devices.rst b/Documentation/admin-guide/devices.rst
index 0dc8c5b98e30..b103ba52776a 100644
--- a/Documentation/admin-guide/devices.rst
+++ b/Documentation/admin-guide/devices.rst
@@ -115,7 +115,6 @@ exist, they should have the following uses.
 /dev/mouse	mouse port	symbolic	Current mouse device
 /dev/tape	tape device	symbolic	Current tape device
 /dev/cdrom	CD-ROM device	symbolic	Current CD-ROM device
-/dev/cdwriter	CD-writer	symbolic	Current CD-writer device
 /dev/scanner	scanner		symbolic	Current scanner device
 /dev/modem	modem port	symbolic	Current dialout device
 /dev/root	root device	symbolic	Current root filesystem
@@ -129,8 +128,8 @@ exists, ``/dev/modem`` should point to the appropriate primary TTY device
 
 For SCSI devices, ``/dev/tape`` and ``/dev/cdrom`` should point to the
 *cooked* devices (``/dev/st*`` and ``/dev/sr*``, respectively), whereas
-``/dev/cdwriter`` and /dev/scanner should point to the appropriate generic
-SCSI devices (/dev/sg*).
+``/dev/scanner`` should point to the appropriate generic
+SCSI device (``/dev/sg*``).
 
 ``/dev/mouse`` may point to a primary serial TTY device, a hardware mouse
 device, or a socket for a mouse driver program (e.g. ``/dev/gpmdata``).

base-commit: 7f3c3a0a9103dc92c823f27db3284ac2914e7558
-- 
2.39.5

