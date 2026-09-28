Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A4A37B010
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610410; cv=none; b=PMd83EC/kSNSsZgsDNKpJFZ+uCGaf8X1QvNsmzMGkC4AEQXGORb2SLNhsgn/fNKqhs4stA9avijGY/lXsqddpHd+9XJOoYS0d/XU9Ifu5ViPlzKRTe1JHmahk2R7DitCqbSSaL1SIUw+z/S/hMhxI8xKm+RCMzyewqbjM7tfN1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610410; c=relaxed/simple;
	bh=C+IjfTCWUAOVxbfLUyp/OmClI+bARXJBCrhUJf/amWQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KLXiDfOn3QfbgR9fdW3Q3cuaC0J6d+ZMy+wX/KaNJIEU5YZkJZHw07v/eA5TSQwc+iTdTVqSgkUTuWGvqlwnx6yDHttSgldiQ8963pA4MIXvK5bllrLZcCroFGYCxTRGH5RtJ6RRaiMbY4N7tDropyDf6zUb3b0p3dAtVvLxaqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Z4IVwcpZ; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Z4IVwcpZ"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aa8d881so3162549d50.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 08:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1790610407; x=1791215207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7d9v+dnfa33+IGduUY6om25xsOtSS5Ke8pK1c1zkhs=;
        b=Z4IVwcpZJEhH7ofdkvQT9piZ3ZJZ78Sjhs2n/FO+eRRE1xajp0sBE7PouiS4agLKLB
         8EhGOxdxJZGu4c9r91QLESCNRCYLGdP3Ugl6h6sdl3T88/dZiAXOUyVOBy5cOjGxYqa4
         jRUA0CYEkjzT3CqLzYGUg/vMGGfsIicUasfnewNjp7OgXTE34kvWjKnhtL2uqpxrnK2r
         lioINItW9L6k7fDLmue/bHXgBjAHfI5eKoax8pIncxICOWQKKM5C4PW369haiGvnmN6y
         1Z7ayqu1Ytpr+VHNiWXHStcvK5ZHUNQPGJ+z3UGKgHPTWegeRaTmSmJfZBuAcyg2pmU8
         6n4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790610407; x=1791215207;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7d9v+dnfa33+IGduUY6om25xsOtSS5Ke8pK1c1zkhs=;
        b=xy9nhqfFAidjSg5jMBE58JAWI8dRbAcayOBGvjz4H8KiJ5lBAQA4k4SvuwbRT2paxO
         xCipqO+Jw4+hGdRlLEj3xOHqnPvVRyOgdAqakQy0D4A1ofBwORvGvABo6a6hSzfjLPIo
         UT9QEl5vGmgVg7dtW+c+rBQMdgAja1ajpLtth1s9JlcVW/Z1GxyPd6D9rKq4cQ5w337q
         oEKc/2YO+S36kQb1Lu86MnAfV1Z2WCfqfsjQ3SH4TQBCvK5XI0FeWy0mI+zASUNm1WOk
         v62YNjNQRdpUydriw+gGeK9G3MVe/FmnWY+D9bNcXatu6SOGmHXOXxSYpwQSshlsIMjf
         pobQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIvHYhogB2Oecgic+QtYYs595zuqbAl02dxKwZIqrLUgquZEmF26rKBmNQ6K3n6Tq3le4kYakRgvk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSkwSB1mCg2M3mm6jB9ClUITSJiYfG2CSxndJhsakYTFa4kUxC
	OgP6LnHdcIbCy2xy9lKEeDrVoU48vnG8Cftjpl5qz5ahC9lh4bP7FjbnXlK1bVnSwQxVWCkS8DZ
	XnGnDRfM=
X-Gm-Gg: AYBFou1V3DuhhqOTetvHTCpNaDUAQUQ0aNsnPn+HMI4jaBQMlukUhq52Q2V09lOoqzl
	efPhJtPVwFEibuG1jxGbJ0LdNlrW1frPq9vVbl6oRU1ToOTRvTo4hy6Zg3JTfZvehrE9SX1gPGK
	6veZnN+QSz+8nTVE10eGU65PXYY45lqYMC78R/JXfnJIJEvs+sS22W7anz+/zkf6yfIJUJrSVqp
	YWuplsWnoOeKIiQhbWIek96HsCf33ZbphZqo5htXLTN5Jhl8A7qanclpyTEDZqoKRj2GeOKkZvk
	fJYAJXXsBiO6Om2Ybd5YcvTByxYO/HDmttIWVLrv+ND6/JTpl/suQFHx3lYt2g/QWKY8gvVnLDd
	+nZUDrrPQaE0nAFZBWryqv4WGFE3pHulIZtI8G/vm2+4xW8soXhi7HgPIHnSWpJpP1KjMc3SsGO
	QGaqqsdtdALiCc/kEv1EA/8HeBdX1sVgLwy9XUIfI2sB29gDAcnSaqAs0xMVRTrwNxeNQiIbf1l
	WGzcZ12vGigHoASPh//MvjPv2BC1nu31FMr
X-Received: by 2002:a05:690e:4093:b0:675:3247:9b40 with SMTP id 956f58d0204a3-6753247a525mr2940923d50.65.1790610407271;
        Mon, 28 Sep 2026 08:46:47 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430e281a8sm82875936d6.33.2026.09.28.08.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:46:46 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v9 00/13] PCI: liveupdate: PCI core support for Live Update
Date: Mon, 28 Sep 2026 15:46:43 +0000
Message-ID: <179061032462.173069.6066907606098407222.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918200640.887030-1-dmatlack@google.com>
References: <20260918200640.887030-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 18 Sep 2026 20:06:26 +0000, David Matlack wrote:
> This series can be found on GitHub:
> 
>   https://github.com/dmatlack/linux/tree/liveupdate/pci/base/v9
> 
> This series introduces support in the PCI core for Live Update, enabling
> drivers to preserve PCI devices across a kexec-based kernel update
> without interrupting the device. This functionality is critical for
> minimizing downtime in environments where PCI devices (e.g., those
> assigned to VMs via VFIO) must continue operating or maintain state
> across a host kernel upgrade.
> 
> [...]

Applied, thanks!

https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git/log/?h=lu-pci-preservation

[01/13] PCI: liveupdate: Set up FLB handler for the PCI core
        commit: b9affdf3de08c9e5fd8dca0c0bc9c54041362a10
[02/13] PCI: liveupdate: Track outgoing preserved PCI devices
        commit: b7163342c1d4090bdd3eace61580197b2372bd34
[03/13] PCI: liveupdate: Track incoming preserved PCI devices
        commit: 16c1ff9563333530f97888fca4e48548b22ce282
[04/13] PCI: liveupdate: Document driver binding responsibilities
        commit: c7c6bc42b3eebba0562d128b5a578bfbe6a56d31
[05/13] PCI: liveupdate: Auto-preserve upstream bridges across Live Update
        commit: 6f58dec26ea52b6451b3b427caa3326b407883a1
[06/13] PCI: liveupdate: Preserve bus numbers during Live Update
        commit: ec2f2f51120b9461db0e04a7fb1fcdd9747fd96f
[07/13] PCI: Refactor matching logic for pci_dev_acs_ops
        commit: 05d208bda0fd3ef41c3452d1c3f5b365c75b59ae
[08/13] PCI: Save and restore the ACS Control register
        commit: 9f2072fd93310487bf3f51bd61f73ed722be3cc0
[09/13] PCI: liveupdate: Adopt ACS controls in incoming preserved devices
        commit: 16709a37292e480a2d560242d88ba400e0793706
[10/13] PCI: liveupdate: Adopt ARI Forwarding Enable on preserved bridges
        commit: f20575f35fd9ae63f80bc672fc6b31e4de12d4f7
[11/13] PCI: liveupdate: Freeze preservation status during shutdown
        commit: f6590754926ecb0f9119f82a08ef073038ca3293
[12/13] PCI: liveupdate: Do not disable bus mastering on preserved devices during kexec
        commit: 25ff6ea537fa2c1258cb73d57f11d6af51ec7f8c
[13/13] Documentation: PCI: Add documentation for Live Update
        commit: 3b4d450a5bff74e36b4c9e864c0ba7d08288941d

Best regards,
-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
