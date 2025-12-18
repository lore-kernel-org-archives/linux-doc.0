Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D5D1A5B84
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 22:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766097085; cv=none; b=YtAyfCNauXH09Lx8weKo1tRO3zulociT6Oe+AVXcfhPMwBXHIBdlM639b21C3jLHdWsSYiI/J7iKNiv/fMWwCnN8V4abcOsXE9SiqgkP6UUtcyeEokgELpTVR/l+4+8hygE2MmQeBcTcVmP3NBgYdl468ckN3EqngQAvTTMhVYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766097085; c=relaxed/simple;
	bh=T9A9RSx6r68PRmG7Ulq/Q4BbIkwiLt9JIVWG5jnzuXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALp3Ibypy91L69LPs0xfC3sAvVIbsczXIHO04FA3Dd/KPtvBSVYDDoGxc0xPT1Ra1mrxWmP5j7I6G/uGeQqGwqur3+ZkVCGi10HEq9jZki5NPZMDphrjtumB7lfvNeYpfmSQIFzX1fW4B+V1uM8Nw/bYjcdezDvWC7s85g9cgO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=dSedXJqY; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="dSedXJqY"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so1026477a12.3
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 14:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766097082; x=1766701882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0ZERnv75ipSNvUOdThWl0eF0juyZyQV8vJbbiWVzrk=;
        b=dSedXJqYrrYf9JtpByiZn1p/imDLzvtgU+gM5amXanF4cnct6jhw6iGX2m4nacscws
         JfZoGnpbr79UueaVr1wlw3gsaAIgG78KiAfaGzM4aAq3dNgJPB6H/pbGnHvfIHkRQgNl
         TBDTYrtWazhFpFMFrwzenHl5isCaq11QnlNXcX+SlKDHXoXiHQb42u6hM7IJ7h46J/X/
         yNGt0VRxukK/+oZq1ACUIjbVTWn2JAqC0sj8MWCBaUe/mwPWwkKBC5PDH1LzOZfxXZTq
         rSipWqsKmebcgnFml+qz8y7dnuoZrQwyoCNDNXjjhuEIOug4IoMraIzUuaLRMzSXqtKT
         bVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766097082; x=1766701882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N0ZERnv75ipSNvUOdThWl0eF0juyZyQV8vJbbiWVzrk=;
        b=mmDwBH6fkRayzub3ZwUK6PFr19ATV74fTCfb6HXb9X1CS2IYh0nqWtROk72fcHQeGN
         YKiq9khlFTsdWavUkd3sL8OvTYHT633SCg3bXppzGosr2pQvAqowlwlxqcF13OfU8FTj
         2Mt9xZjcH1Abc5ecgMz4BACZe/aFPCNtqCyeZeREkeZORqu/qEEEBpSCVROyG82Bxvpr
         yoygDN7TtryP9EQHoMbXjrLXvVZ0L1hPHim8t/3pBfrVbP92hVrs1+60XjH3alGrkwiy
         ZQCZeKKWwdpAYBqPnSpfO1cLyQVfF1yMNHXQzdCsWV2QYcECRdVcrTJLbwTO77oR7mkJ
         769Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0cJPeA2/ymSOVTl6or+w5qX6EhHMZZVFVpFIKiOdRDfijea8HYAbtpWqhABbcsgH/2QXEt/EoeqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFP4d5dDhY5RRNo8bOVMXYcYaxSycggmxIuyOkbym3mReBDSxt
	pSTtdz9iLwz4bkkKNbHCLv1K/SUofdeNyIs8qsE4Gh8XnOvBMUPxs4FjmJ945gznXyNsYuo8BEz
	MmPAFdWcBT3iDlZiO8DXTqmPL19I24zTUUN3C1xdKXA==
X-Gm-Gg: AY/fxX4tKZN4uaK7or4s39NuHR9/KMlKAS59dXZbYj6nwoGqFU0jHrbMSEPwMZlUUqW
	04o9EjTkVFo0e0S2U3EEnyxaiXvA42dryqaJmJcYgyIWWcEk6jtAJDDB1RQMEVyFomQqvwciwFX
	/qfCvpugnX18grxQ4QkBIuLAipV4+Fwk+Ngz4KLgo+z08IzYbNMNz/lUrk+l3nnZ6zWIJzpJ5oM
	uw+5rQN9ABsL6b4X9F8a+hZ/e062NkNs9ryAwmu4xJz5hnQF9FlGwuoO2tgu5LDIv0qBB+GpKbX
	FJ+4BPX0ferMDt22rIMIs1Js
X-Google-Smtp-Source: AGHT+IGygu6eRodSik3Bfkp3czBNQVMW6XjM1dVil21tieZxpnGb6arOF2/iB4pEiGfMJZadLyOPhelEhWbcfWH40bo=
X-Received: by 2002:a05:6402:13c9:b0:64b:4037:6f52 with SMTP id
 4fb4d7f45d1cf-64b8e94e075mr973035a12.12.1766097081599; Thu, 18 Dec 2025
 14:31:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218155752.3045808-1-pasha.tatashin@soleen.com> <20251218130725.1b93a521c039ce121de62472@linux-foundation.org>
In-Reply-To: <20251218130725.1b93a521c039ce121de62472@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 18 Dec 2025 17:30:45 -0500
X-Gm-Features: AQt7F2rxtCEBDZim20tERMGFS7BGfrYSNxBBeVmqar1M0y5_ubwYl7w-lYf7Aq8
Message-ID: <CA+CK2bD41sMDbN670G5RrNQ-3Qq36dO3LmD18zFu6uc9KxhRzQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] list private v2 & luo flb v9
To: Andrew Morton <akpm@linux-foundation.org>
Cc: pratyush@kernel.org, rppt@kernel.org, dmatlack@google.com, 
	skhawaja@google.com, rientjes@google.com, corbet@lwn.net, kees@kernel.org, 
	davidgow@google.com, pmladek@suse.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, nicolas.frattaroli@collabora.com, 
	linux-doc@vger.kernel.org, tamird@gmail.com, raemoar63@gmail.com, 
	graf@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 4:07=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 18 Dec 2025 10:57:47 -0500 Pasha Tatashin <pasha.tatashin@soleen.=
com> wrote:
>
> > This series includes two separate workstreams. This is because FLB
> > should be applied on top of list_private, as it uses some of its
> > interfaces.
> >
> > 1. List private v2 (first 3 patches) Previous version:
> > https://lore.kernel.org/all/20251126185725.4164769-1-pasha.tatashin@sol=
een.com
> > For details, please read the cover letter from the previous submission.
> >
> > v2 Changelog:
> > - Added a Reviewed-by from David Gow.
> >
> > 2. LUO FLB v9 (last 2 patches) Previous version:
> > https://lore.kernel.org/all/20251125225006.3722394-2-pasha.tatashin@sol=
een.com
>
> Please, no.
>
> This patch series is intended for the Linux kernel.  Your grandchildren
> will read the above wondering "what did granddad do".  It's just lazy
> for us to expect readers to have to chase down links to earlier
> versions and then to figure out what changed and why we changed it,
> etc, etc.
>
> Let's give our audience a nice, self-contained and complete description
> of the proposed changes which doesn't refer them to the minute details
> of the ongoing development process.  A process which is utterly
> uninteresting three years from now.
>
> IOW, can we please have a complete and standalone description of *this
> patchset* which doesn't refer to earlier obsolete stuff?

Hi Andrew,

Point taken. You are right; the cover letter should be self-contained
and stand on its own for future readers. Here is the standalone
description of this patch series:

This series introduces two connected infrastructure improvements: a
new API for handling private linked lists, and the
"File-Lifecycle-Bound" (FLB) mechanism for the Live Update
Orchestrator.

1. Private List Primitives (patches 1-3)
Recently, Linux introduced the ability to mark structure members as
__private and access them via ACCESS_PRIVATE(). This enforces better
encapsulation by ensuring internal details are only accessible by the
owning subsystem.

However, struct list_head is frequently used as an internal linkage
mechanism within these private sections. The standard macros in
<linux/list.h> do not support ACCESS_PRIVATE() natively. Consequently,
subsystems using private lists are forced to implement ad-hoc
workarounds or local iterator macros.

This series adds <linux/list_private.h>, providing a set of primitives
identical to those in <linux/list.h> but designed for private list
heads. It also includes a KUnit test suite to verify that the macros
correctly handle pointer offsets and qualifiers.

2. This series adds FLB (patches 4-5) support to Live Update that also
internally uses private lists.

FLB allows global kernel state (such as IOMMU domains or HugeTLB
state) to be preserved once, shared across multiple file descriptors,
and restored when needed. This is necessary for subsystems where
multiple preserved file descriptors depend on a single, shared
underlying resource. Preserving this state for each individual file
would be redundant and incorrect.

FLB uses reference counting tied to the lifecycle of preserved files.
The state is preserved when the first file depending on it is
preserved, and restored or cleaned up only when the last file is
handled.

Changelog:
List-Private v2:
- Added a Reviewed-by from David Gow.
FLB v9:
- Addressed suggestions from David Matlack and Pratyush Yadav: added
  booleans to track if an object was retrieved and/or finished.
- Modified the patches to use the list_private interfaces.

Previous submissions:
List-Private:
v1 https://lore.kernel.org/all/20251126185725.4164769-1-pasha.tatashin@sole=
en.com

FLB:
v8 https://lore.kernel.org/all/20251125225006.3722394-2-pasha.tatashin@sole=
en.com

Thank you,
Pasha
