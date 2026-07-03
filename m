Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988FC3E0C51
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783088729; cv=none; b=RNQf+2bXCby/sCOpoD+75kxbtLwTRARySZ0samPJKMPxM0z4p4yczgyh9tE3MAfVh/sSjrkRTghwnkvGt9PGXA/AqrlnBjMItX8c3to2KSiecRPb/mDgrhZ8P60uCWgxA7Qz1q7eug2GUp0E55E+Oe4EGMF/EDdDV7Eq7vns7Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783088729; c=relaxed/simple;
	bh=zZxZbH6595Xq322X5wWbuLYwtAjMqlVtcthEp/oj7us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvqChU+5EHxEXLNn6fT/LSOj9hfzohNtje25u0L72lDrN8M3jIjuRkGRLfQqUUQAPJwu1j7kIwgo+rrIBl5U0AoiMC1YXtkgnfAGKJoSJtGG5QWhJSd/3+CIHlVFhQsflzUeBH6932cy1mubWIwkUG9c/AZZkYDuqUqnFBr2SGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nxlshdFc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nxlshdFc"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493be1b9682so5288145e9.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 07:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783088725; x=1783693525; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JUk3WyCzjRTJDLUduYl8EcNRLI38i6zEbMJ49FtDSSw=;
        b=nxlshdFcqsWDXhGlicbEVQY0100PbOBUyOAnyX4Jc7UFgjTIr1BBhkI3YXGgX3XoaM
         OhkgkEZZuMJrrGcPqXF7VtbClvrJP1hqKNvErCAdDepJ0AHufk/lTIuYZ3yEmL2tgKMV
         bcfqym3DBPC3NXwNsTVF6Sg7WcLFIXzpV5ODkb5Cyp0yB2nSVEbRhWG/oqOWP2S8kOjQ
         1Y4bYCaoSSAT1v/fc5dGJpn8BSHQe36+B0vnyqP4nGvfGZb1xHotZSbwkoTXlWSbNmJR
         QCYwJ80vkGL9UZo9NIY5zT4VHb9XYzGOBvepQ/M5yDNs19e7tHR13uZ5JkdlCt67kzZ3
         zVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783088725; x=1783693525;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JUk3WyCzjRTJDLUduYl8EcNRLI38i6zEbMJ49FtDSSw=;
        b=guKK1TiWXtX50EYQgyAe3jV3TOPJVhcQzTDvJmE27lSNLf/FGL6cx/jo3Tw34GnG/G
         Md8jrOPLHrdbBJrhQixuot+ftDHu/SdF2OPVwcxbF5f8DtrPCAFPjgoB/d6YPciVmg69
         p/kjzC/WpqazoWLtNLjUunrpBFnelrLLDbrX4mt/Ee/+UNMUaSr10z/b3KqllKH1q7qC
         i+eT7QUEMhuKUZvmgpSeeq4tpCZ9vZLK7BLV+VeQOUKPNLoSQNijMrtb3vA7ZBLDiu0Z
         PKRt9ZIbko4IXuBB/six1QYpbLOe7+iv5zt/NrJESJ+U7OmVNrkUej0XOPC6MG2T+a0y
         z6uw==
X-Forwarded-Encrypted: i=1; AFNElJ9eqas3jibMe/bsLQW90dxg8uVMVjbADMNPZLH/EbMRaKhzyHUQwaZayp0Qmj42IePAdqqzJWc5tYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YznyShYjLmFMYYNTbLZStbFN2p01xdWnaJq2Pl0MongeDChsGFd
	EtY/V3qKmf+2RYBSBlrCyzPB1u1gFgGLsIuULEzQ4eOg2T2MIlKO9lTAzKN9L80Ldw==
X-Gm-Gg: AfdE7cnG9XIuNQgkcNb/rP8bziGF7tP54+PfT5FPdNSdcnIgEAF52m6Mo6DC2oo+vpY
	0WfaE6ua3njVTIfnoGADla6hY7hRxH9Aco3c6eWTYSZajXGCR1hRPSVfz1hcOebWMZo1ShlM43R
	Mejh3HYQBu4iCFBDaNHtGYGe9OHbXIU9/79ggrA81SSiREubCemZ3CbYovGzsCIgc++I4YJs9k0
	9CKAzT0+vdlEDiOs88SsxBqxbpOphJc3PBdZmd6HbysNvMsEnOIIDbFpHuR26nTV9r7jgDKwoiE
	TcKkSbakJRi/mHumR4YrMwZVZmfZEZGGMbfgrbDfULwtLrXtwAOx2twihR+P8/p8xWhXOr1Q1e3
	09PpHdCfl2sFAn4C4hoP/Xd5aPuYg9zcP91BCs7TlUhj1IsO5NogWid6A98sZrPYh+I/20gG6DP
	xE5K+CV1LK9SGNVgccQFU989kdZ2VQDo1VSagGV8/Kofk8bqApkKDQAw==
X-Received: by 2002:a05:600c:154f:b0:493:c453:600f with SMTP id 5b1f17b1804b1-493d0f096a3mr1332665e9.6.1783088724566;
        Fri, 03 Jul 2026 07:25:24 -0700 (PDT)
Received: from google.com ([2a00:79e0:288a:8:26a3:e133:527c:310f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm72829725e9.2.2026.07.03.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:25:23 -0700 (PDT)
Date: Fri, 3 Jul 2026 16:25:18 +0200
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Lee Jones <joneslee@google.com>,
	Lambert Fan <fanzhaoming@anopc.com>,
	Zhouwang Huang <honjow311@gmail.com>, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add OneXPlayer Configuration HID Driver
Message-ID: <akfGTjId84EjV141@google.com>
References: <20260419042624.625746-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260419042624.625746-1-derekjohn.clark@gmail.com>

Hello Derek!

On Sat, Apr 18, 2026 at 09:26:19PM -0700, Derek J. Clark wrote:
> Adds an HID driver for OneXPlayer HID configuration devices. There are
> currently 2 generations of OneXPlayer HID protocol. The first (OneXPlayer
> F1 series) only provides an RGB control interface over HID. The Second
> (X1 mini series, G1 series, AOKZOE A1X) also includes a hardware level
> button mapping interface, vibration intensity settings, and the ability
> to switch output between xinput and a debug mode that can be used to debug
> the button mapping. Some devices (G1 Series, APEX) use a hybrid of Gen1
> RGB control and Gen 2 controller settings. To ensure there is no conflicts
> when the driver is loaded, we skip creating the RGB interface for Gen 2
> devices if there is a DMI match.
> 
> I'll also add a note that Gen 1 devices also have an interface for
> setting the key map and debug mode, but that is done entirely over a
> serial TTY device so it is not able to be added to this driver. There
> are also some "Gen 0" devices (OneXPlayer 2 Series) also use it, but
> the TTY interface also handles the RGB control so no support is
> provided by this driver for those interfaces.
> 
> Signed-off-by: Derel J. Clark <derekjohn.clark@gmail.com>

Sorry I am late to this review, but here are two issues I discovered
when looking at the code:

(1) The functions oxp_hid_raw_event_gen_1() and
    oxp_hid_raw_event_gen_2() are both forgetting to do bounds checks
    against the "size" argument.

    For real devices, which send a real report descriptor, these buffers
    will be large enough, but a device that sends a faked report
    descriptor can provoke an out-of-bounds-read here by underspecifying
    the size for these reports.

(2) oxp_hid_probe() and other functions are populating drvdata, and
    drvdata is a static variable.  If you plug in two of these devices
    at the same time, they will step on each other's toes, and this
    leads to all kinds of memory corruption problems when they do.

    I believe the right way to go about this is to allocate a separate
    piece of memory for each device that you are plugging in.  Other
    device drivers do this uing devm_kzalloc().

Disclaimer:

I found these through code inspection and curiosity but have not tried
to reproduce the crashes.

Per Linux's official threat model[1], these are not considered security
vulnerabilities.  An attacker who impersonates a USB device and gains
illegitimate access to the USB port might be able to provoke these bugs
though, and I wouldn't be surprised if (2) also just leads to system
crashes when using two of these devices at the same time.

—Günther

[1] https://docs.kernel.org/process/threat-model.html
