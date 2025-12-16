Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0E417C77
	for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 14:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894939; cv=none; b=MUBItg2fJ9yIzH67HgXUZncXxW8FBibjXgJgNxkGYfKPMP6gqHOppK9eNSCrwYGpIDLpZXPxn6fhhOFD2PKNaDqWGFR3dc9gaB44qb6gDEl3IuoZUCGh+Xi4Px6lRjma5SWERgCMooQ25rMLeuI+Sn/qDwO+AuU9ZpUrl6V2PLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894939; c=relaxed/simple;
	bh=0gHjZ28GOQXJMqA5yVaPqpk2yUsOqFiExkjx1I8Ir7o=;
	h=Message-ID:Date:MIME-Version:From:Subject:References:To:Cc:
	 In-Reply-To:Content-Type; b=hZbxDR6AuCmAQQhnQxy8ylNv8egs1gAhuIsjbJSsC850HB1aSPYw3aiGZ41J9gUv9ymbZBMMS0yI4cJskiLIlfISU07XA9JVMrVBONuarMq4SOBXz9aF/9Pcy2sDuZuzSIItYbuz1cs+S2LwAOM1bjaJCG/tsVyu1aBJLiVxaZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KpK5x1g2; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpK5x1g2"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5958232f806so5411275e87.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 06:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765894935; x=1766499735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:to:content-language
         :references:subject:from:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kIgGXfcRiG5BfUJ/7AvxVyHnDqJxTzoTd++kzcwU3O0=;
        b=KpK5x1g28it+moxSn1hkGH6GDAoTmCuH+vQw9KkX2rVKDrkMrTIILDQLGIvxqJZaFu
         jPqynpD1vulCoR0g2emnkgJGnpHgefGUGicUlfuRcqQdC8wxiUn0iZyWi4F28Ivt60bo
         +eN7xRLmcd7TK+JKAv9Vsob5RAqifOL8/JRpc+cw+Dc4XCAslabwHwlAJQSE6m9wHec4
         Vruaa0hoUViw+oC/OPhckpZM4AA5VbAN1Snaafqr0lLOLjgWwHrVMs4HoiW4B7KMTpPx
         YkXmzT3KGacJei3j3EV3AwoZ38wbrx8DCgk8O1Va3AeSXcUuwLKnWk85FoluhZ/SuuSW
         7zVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765894935; x=1766499735;
        h=content-transfer-encoding:in-reply-to:cc:to:content-language
         :references:subject:from:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIgGXfcRiG5BfUJ/7AvxVyHnDqJxTzoTd++kzcwU3O0=;
        b=qT+pFGoklBsAkpkCYIiSpCdkSzU0xi04fRKaiiFZoUCB06vQwMlhpAZiqqu0BJNtVS
         dg3ButdPsC2cOad6MDJC4FgkhQ4pL27q/1Z3OtkyUvQrLsj2CQIVBkY3qM3zRnvUz4VW
         xAX6yfTBA8C/fh/q8IJOxz8YtEYXT5seW/pCBZUTDyzkI0QTm+tfF1ClJZ651HY2uEl4
         sh72jNF94g+y8VEM5DCdAULCv48atBStbYZ8CjuqE6pgzyWVqzqIxp04hSJyXmhlGRRN
         IEVqY0twEO4kkLmbsmcdjGhBjlUYBTuX+IZqRplRwmL3OXAve9kJqQ4fQNYwAP20CdWI
         rN8w==
X-Gm-Message-State: AOJu0YwIEUKxK3ML6BQqvGrLQg4/UOskTcjPdmFRUbtwgzds+JlGmiym
	dW4rCJWAcf08qLYiBBKRkct9Pj0APrNmwVQk+XCViapHVUDvSD4VzWfcyCrN0bXD
X-Gm-Gg: AY/fxX5UY4xucZxtdN/ln5tL91jlP/b5wjQbN5f76PSPB31RUcz3suQD+J+aGd72ilN
	PXj9GwQPTbN1+zK0OEI4++9tKWIkv3jzdC4QO1MEPm7bA3IrN75/e9gRDROIN8T4YSNi10MP7ox
	UDvmNrt4NoRQp/KKpd2YEq8fPQMULnF1BUS8uzaUatFJUgKxiF71jFIv+TmoPgDHUXqBrz9WG1Y
	lpIH8F5wfmGTh9+OulAniHJw5X/gsz4520g3jd34DT527ei35kzjbnZ97cxnPE8wVhrFBTD3BIU
	DKxbdXC8rs51kq66o9ZlWi5UpJud6hpYvNM9yaq3dBzoktqKRtVSQRCHXI635Nv/ovqLrVCypRO
	ArhVZNTIo5xHvEhUPfAoI7bKAREVI0Ck3pqfWbG6K9mG00Y6mRvWy4ddhOaD9n8tv/4FgPY0Qpe
	8NV6Gq8h/oy6PdiPUHfXnHZ7TH+0VngCOj2g==
X-Google-Smtp-Source: AGHT+IGRic887433aWZneFSTJnIB/alVjcglCEWBGwHpTwjXio1GWPslq28k5EW8yNypGThvUtcbYw==
X-Received: by 2002:a05:6512:3d07:b0:590:6119:6b73 with SMTP id 2adb3069b0e04-598faa7ce41mr5525823e87.48.1765894935102;
        Tue, 16 Dec 2025 06:22:15 -0800 (PST)
Received: from [192.168.1.149] (nat-0-0.nsk.sibset.net. [5.44.169.188])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-37fdee09417sm39689261fa.45.2025.12.16.06.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:22:14 -0800 (PST)
Sender: Maxim Nikulin <m.a.nikulin@gmail.com>
Message-ID: <3d7f473d-174a-488c-8852-533b8a81c58e@gmail.com>
Date: Tue, 16 Dec 2025 21:22:13 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Max Nikulin <manikulin@gmail.com>
Subject: [PATCH v2 2/2] docs: admin: devices: remove /dev/cdwriter
References: <aSuj66nCF4r_5ksh@archie.me>
Content-Language: en-US, ru-RU
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <aSuj66nCF4r_5ksh@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Remove /dev/cdwriter from the local symlinks table and change the
related note that this alias was removed long time ago.

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

I hope, I have not missed something important and this patch removes
another discrepancy of documentation and current contents of the /dev
directory.

I wouldn't mind if you discard this patch and to commit another one
with better wording instead.

Earlier I submitted first variant of the /dev/sdc<N> patch without this
chunk.
---
 Documentation/admin-guide/devices.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/devices.rst b/Documentation/admin-guide/devices.rst
index 0dc8c5b98e30..842f9e503760 100644
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
@@ -129,8 +128,11 @@ exists, ``/dev/modem`` should point to the appropriate primary TTY device
 
 For SCSI devices, ``/dev/tape`` and ``/dev/cdrom`` should point to the
 *cooked* devices (``/dev/st*`` and ``/dev/sr*``, respectively), whereas
-``/dev/cdwriter`` and /dev/scanner should point to the appropriate generic
-SCSI devices (/dev/sg*).
+``/dev/scanner`` should point to the appropriate generic
+SCSI device (``/dev/sg*``).  In the past the current CD-writer drive
+had the ``/dev/cdwriter`` convenience symbolic link to a ``/dev/sg*``
+generic SCSI device, but its creation was removed in ``udev`` version 115
+released in 2007.
 
 ``/dev/mouse`` may point to a primary serial TTY device, a hardware mouse
 device, or a socket for a mouse driver program (e.g. ``/dev/gpmdata``).
-- 
2.39.5

