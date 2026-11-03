Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793733691;
	b=M0fRf9ZBIgfAs6TcJzIZxiU7zgP7kai0WTyBwHtcOqn/AGskmNsIWGgJM4SPyBNKh/wt
	 pZTCtm7L83w5QJEnaZT8o55zdwYdiTgUbf1jlegAvrPncKx7x4bmy+C3ocM+gYu+Fa7s8
	 0Z1JwI3lNZg0r0EN6+qUKGkz8Ahcx29dZTmtUSVBJh1A83/duHXzjOH1yO1ZAsnp1oiKb
	 +5XGrKrBps8zWQXa6XLFyFoPDP7j3efv/vigVs46+frg0+AIm5m69Akv5qwH2veOduShl
	 tY29nHclh5EHRBbqKaa/Ng8+Cn/p5bHfmAFt6kuF/TSwd9zMDEvFtdKtSREX95kcB+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0uILcWGxRJkmEp+n0zS/w9W2zfSCMknq4cj8Cc7NJqk=;
	b=BwpG0BeU6Y6JigNUPkl/QNEwxawjFQKi+Z9r4XIJkqtDxmkPrVS/AE3ljZIwffUgdO1M
	 BOsXl3VWl2wStPIEXlNIZZ8vbC7LUq2y8f5vyK3bKIdhB5UyLT7x3ZOmC8juSDtWrVbBr
	 LXhQALHHSsAoLSyr3Mt47yGu1W4WPT4guI+AhIE1BISXP4k4ZEljZTuEw591wHmglLQh8
	 G0hS0xo/mn2LoiQ9jPkrAcOg4w+qNEBlPMY//DxpEiIiDmSTEuNkWWvplmYqs2DgtLrzZ
	 9FXvgr0MO79IiNn0nFMDq0GPCSvt35E1AntFGDy6LixHbuPML0cRNHB4Mp4Uzu8RCAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=d22vkpJR;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F30606A324
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 19:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F30606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=d22vkpJR
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-745497ac8fcso1858942137.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 11:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793733690; x=1794338490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0uILcWGxRJkmEp+n0zS/w9W2zfSCMknq4cj8Cc7NJqk=;
        b=d22vkpJRlgq14YglxmZuOPieOTiLBhGF2kUY0z7AJoS5MryihrsLf79bjz2fc1+tKB
         TI6jwIAUniGEOvC5e7nvK3EwxIGTMHbmh/Alh0axZTWYZ2d8w9Q+gJh1zqXkVvBXuku6
         UGxGkQQ/W5fCljMfHkImECO+0d1yoFYw2Awehwr5cTNh/tdE4qMvKToh36qHv16SO8S+
         iKSRuYXi8k1JQOsoy3m+7PRCiAfbNI/u7j7X8f6ZhdIuJ3F/kiLusnZZuaJd9xTDEGf2
         uAZ/l+P70Cn7SmZzu58tzeK+wfda/lFpE0XRDNeAUNhXpk2RFx7vwAYYPc5NFEXgRI16
         kj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793733690; x=1794338490;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uILcWGxRJkmEp+n0zS/w9W2zfSCMknq4cj8Cc7NJqk=;
        b=BzXj5+vZlQ+R724LPKE9Mu842rQbi5jxAhxOkxw3HfWHXkElqcfUtcnTBVDkSf/9qt
         L4AQStoAD1p+MIZKqGNGsG8Ar12d2eV/GTFZJNW5bkN7X1/QRfMy7rjFIqFEwKTGPUQ+
         WHATTSgdjZ07+GXugqvPTKtjAT60VyloK7wHGJI6p2YDDXU3u+a9C61LwOKlKyOfZCzm
         KOScFfz/TQw5B6L59aAydjnyX/dDB2dS/IXiQBgeHVvXKiApEsT42KIAswv9hqly15pK
         blSMcwJZFqJzP+L5VyguKNs0y73ZT+vXnnat1suWxzreajaIpmUAFVemkSjOmO0nzRoM
         sx9A==
X-Forwarded-Encrypted: i=1; AKwUvByfgVf29wR+SqsS7MfRdrWIQ0rQvhqEbcH5AnSdPLTzMAKmYrpXRd7jHtFft9yyzcWHq+gv4D0D7qg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K4NSINJ/jl5F7mgjDzDnMDvSFXcQTx6hMGmhKLcmnZ+10fmQL
	VcX5wDwF+InxoSVtx303IQW6d39tINMzZ49R2Y9/QfU/zdLeVhXKOsYE0sjOnfMaot3T2Y7bgw2
	UOjdI
X-Gm-Gg: AYBFou3E1jImnuBSSsey/KlhL+M28fSJQvpALx3LAJRYjpYKh50M1cul1B/nJ8J5+JR
	D+bM+b/HJRmUeH8w5tDiAVDeIaJQE6C5PI6x/xQsD2OaDHBeeoC1M//Iyk+N35UyZ/zSI1KDSkR
	HNpkaWTjBXkQ/o/H/tP9jCnPPzawrxUbIlHbH2kzhcl9dv2qASTcr5LoeE7wNQKNxTwAzwUjG+C
	AnIgDON10CDPUiG6V/r8T/cNqUColgetyoZyfZOicL1T4sH/eDk1i9wD8nFHZ+lGSAy6BPDzK7g
	2dXu7WC2asfbxUoWLs7bmUwAxlKWZG5Pq3D2zOT7e675/a1HEKjnmX4SadEyJmt0eM401WbPwKB
	LpwKQ35gxr+SQvrOIIDIAmlCGtdI/Fyh+6sdi0jLB2P8kA9to5RbE1LWx7VUgrj8qRwbuRE9rlf
	M95Ws38VZZ+po8Ast/ENiFrFEYxWF5Su5AsUdM78l8Sjq7Ct39OT9jVg76XsIM7qKs5y97Ua43e
	SLRpUsvfBWRc7NqwAyYLwZ8scqzJOGPnW3OzySBmoHID23mvDSu8BZZbtTHEypOAkeGaKyU0FU+
	kEbu7lttOIFW4U771pLqS4+Fn9qBY+D0FEyei5J1y+leQsFOjGo/k4dviV1grMpiyZxLHRGnSbc
	T8sk7RMp9gAJ7Q7qQGjf7CqWBG/ETelkk2tt8V5nnsLlBIFjYyPg5SKuczm9NbzmLg/XYdDosBA
	==
X-Received: by 2002:a05:6102:6c4:b0:7ce:78f9:adfe with SMTP id ada2fe7eead31-7d072c17d00mr5173411137.18.1793733689733;
        Tue, 03 Nov 2026 11:21:29 -0800 (PST)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d999c2ccsm560241.9.2026.11.03.11.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:21:29 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v10 00/13] PCI: liveupdate: PCI core support for Live Update
Date: Tue,  3 Nov 2026 14:21:10 -0500
Message-ID: <179373348545.623992.16522569527665218421.b4-ty@b4>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261013162529.1928093-1-dmatlack@google.com>
References: <20261013162529.1928093-1-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 13 Oct 2026 16:25:16 +0000, David Matlack wrote:
> This series can be found on GitHub:
> 
>   https://github.com/dmatlack/linux/tree/liveupdate/pci/base/v10
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
        commit: f874391deedec9be601bc044f2aed52a267a3671
[02/13] PCI: liveupdate: Track outgoing preserved PCI devices
        commit: e207461556c0d3a42fd59dc548e9e8f599aae298
[03/13] PCI: liveupdate: Track incoming preserved PCI devices
        commit: 42907d099a3c37f5a089d92465b3a61de9c7cbea
[04/13] PCI: liveupdate: Document driver binding responsibilities
        commit: 78d4d22c0d4e0830a5db9b903f1325b7fbe0eb17
[05/13] PCI: liveupdate: Auto-preserve upstream bridges across Live Update
        commit: 8178f14641e2d7acf648acc33a0cc070763250af
[06/13] PCI: liveupdate: Preserve bus numbers during Live Update
        commit: 3f832a32a1801a9e7b1dc4e88a3e1744a316b538
[07/13] PCI: Refactor matching logic for pci_dev_acs_ops
        commit: 966230f2ebac2013f60ba6376a6ca726f6427ecd
[08/13] PCI: Save and restore the ACS Control register and Egress Control Vector
        commit: 88016172c5585b1dd0d777ec529fcac577e4e94f
[09/13] PCI: liveupdate: Adopt ACS controls in incoming preserved devices
        commit: 1fabde9a0e4964ac43e8ef3f0c9619d8ed80cc23
[10/13] PCI: liveupdate: Adopt ARI Forwarding Enable on preserved bridges
        commit: 5506c59d1b844edad5cf2a704f8b87b353b3a2bc
[11/13] PCI: liveupdate: Freeze preservation status during shutdown
        commit: dbe2c3dfd43f9aa094b59669b81aa92b8685d23f
[12/13] PCI: liveupdate: Do not disable bus mastering on preserved devices during kexec
        commit: 534abf9f0870b457e1e6f4ef8267b0471e9d2c2c
[13/13] Documentation: PCI: Add documentation for Live Update
        commit: 5d995129832f72dc7a3870eabb216d487a145cf3

Best regards,
-- 
Pasha

