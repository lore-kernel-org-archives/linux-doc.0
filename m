Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A2C1E493
	for <linux-doc@vger.kernel.org>; Mon,  3 Feb 2025 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738594508; cv=none; b=kSeyNjsZexlLGx9thILiF2oaJujOieJbnFLDSj1I48G8sCU3g1MTCsbtE7jJsYLhVDiHL5oj6qvNiejKT1McL7+0qbHestA5wR37ki4U3gZWPIpJ+FoWITOgXsGgBktPac1YgM2tZjW28VKVn015R3Y4loKlhQUS48e68yYBed8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738594508; c=relaxed/simple;
	bh=gHsMCkJs2riOdbZqFloAv69IQ1+bLd02YtAO/lKKkyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgJTezDrZ6d06alQ4AMIiOKHFvdmbrzaDrEhpmCDz/bl1+7rrHP7QJVJizW8HUFeLGxK+vM77frxnNw5NXo8ldV2ZXFOfhuOctz3YfYXMxuYRENP9ILgn8uklkxcXOKJ6T8+jmtY5jPFK/FwPhcqF6ESiX255xNKzXNDRga+QC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cL76iXY+; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cL76iXY+"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dc7eba78e6so8210832a12.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Feb 2025 06:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738594505; x=1739199305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPLbYVOavTEUypWZqa8GromqJrdVJu+j93QkHV16eYo=;
        b=cL76iXY+ZzPKAR5vlscxs+EkVleeWJMDCPx/rC0xD4sp8Sg9U1I4Hs8M/PjLG7waLx
         Eam9dpam7NfNqHqS3luBiL/Eko8BrAosK0IWVMRmlXqM49otV3LAaFEdTvtOUEY9qfdH
         q9Uypoe5I2VUJjTddGh0beSZYyLlUzFa4QeTYE3izdO01OfEOABcJgjdoByE6CUdrUqZ
         upGN3ejz+2UvtjnlQoYMeeZF5ZLmLz3iM58qJjFAO/BkZGGzqsl6qEviRu8Up62egvsj
         QIpuHsEw3wyNYEz38fvN2uv3AgxI9VBSgrC+i6A9bwBedMIs35MExfXgkaz8u7mXuFAY
         kcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738594505; x=1739199305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPLbYVOavTEUypWZqa8GromqJrdVJu+j93QkHV16eYo=;
        b=DA3ZMYC8Xzt+bbg2w0QFMSKfrf4NmH+SNYxC3Wl+3ExuMMw+qmjHlwgL4AwHKM6FD5
         3S/S45WREcHhlksiDkAEscrP8JRjpgPMfElx1R6sFaf9vJEq67DKkiejBF4tS3yZigOL
         yvPAQp+GsUG+VdsLWxpRZ3+fWhFINdVNGVW8gn9ENTlB28bXZVlhJuZKUsHl9pzl9RKk
         qV4x4kinxvHcqh9jKlFi5wg5VeouOi/qvt+XecfNgBZFxmHro17SA/2JVsxI9HX5ifkJ
         QOx0YgeKTN5ZtXLOOJkWsPKMa5xkgwMCJa4H00zRDoHsYQkF0pfBPAvbF6/6J0H6Hliz
         N0lA==
X-Forwarded-Encrypted: i=1; AJvYcCWy4lKGHNzc/Ltp8b6ySqCyrtWMb7w66URzWnEkeuuxUwRZBRljzspJXnhlvzeS7AU3x7kUoIhja9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyDQWMs54njTRyEqyNkEuwNMy0tDDe0LDvzwwE0fDJG4gSvWL5
	7uEUdqGX2wdJjGMKbVTy7PaSGynjEGyZzzo2wMj6eytKyYIBINbreefMz6vukdSZgQ1z9a4dM/2
	nO6Cy97AKt1ZctJM8nF/22lc9fcXfblkwLY4m
X-Gm-Gg: ASbGnctZHFUwkShxiNu4Zr8W6Zc6ZzpaGoTshkGNmmD6cg9Wt0JIczS1I8bD4GPKvqi
	8johKh/MvXBii7KpqZb2rZB/TslxSc8mG2sYKHnzZ54wudXlLg8fARhbVOIwwpyA9Z8B+zpIDZ0
	7Zt9J3DwBZCqen6RFePkpIMsUqZac=
X-Google-Smtp-Source: AGHT+IGcpwf5EdKTyXQE6gz/RvkY8eJ9LO3a0HUryA2bwhyjtOJ8CO05/pbFPzpgmPE6/ergR0yorR08N7WUkycDAak=
X-Received: by 2002:a17:907:9413:b0:ab6:f68c:746e with SMTP id
 a640c23a62f3a-ab6f68c7570mr2013871466b.41.1738594504724; Mon, 03 Feb 2025
 06:55:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1737577229.git.babu.moger@amd.com>
In-Reply-To: <cover.1737577229.git.babu.moger@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Mon, 3 Feb 2025 15:54:53 +0100
X-Gm-Features: AWEUYZnsxLCyQ3OS5U7o9ezateKgGmcWHuzP2hO3Yllsafh7G56R-7FYrvqlTV0
Message-ID: <CALPaoCgiZ=tZE_BF2XzeYMRG84x4+kGKfhHWj2Uo=Cre_B_6Vg@mail.gmail.com>
Subject: Re: [PATCH v11 00/23] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, reinette.chatre@intel.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	tony.luck@intel.com, fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com, 
	paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com, 
	rostedt@goodmis.org, xiongwei.song@windriver.com, 
	pawan.kumar.gupta@linux.intel.com, daniel.sneddon@linux.intel.com, 
	jpoimboe@kernel.org, perry.yuan@amd.com, sandipan.das@amd.com, 
	kai.huang@intel.com, xiaoyao.li@intel.com, seanjc@google.com, 
	xin3.li@intel.com, andrew.cooper3@citrix.com, ebiggers@google.com, 
	mario.limonciello@amd.com, james.morse@arm.com, tan.shaopeng@fujitsu.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maciej.wieczor-retman@intel.com, eranian@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Wed, Jan 22, 2025 at 9:20=E2=80=AFPM Babu Moger <babu.moger@amd.com> wro=
te:
>
>
> This series adds the support for Assignable Bandwidth Monitoring Counters
> (ABMC). It is also called QoS RMID Pinning feature
>
> Series is written such that it is easier to support other assignable
> features supported from different vendors.
>
> The feature details are documented in the  APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
> Monitoring (ABMC). The documentation is available at
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D206537
>
> The patches are based on top of commit
> d361b84d51bfe (tip/master) Merge branch into tip/master: 'x86/tdx'
>
> # Introduction
>
> Users can create as many monitor groups as RMIDs supported by the hardwar=
e.
> However, bandwidth monitoring feature on AMD system only guarantees that
> RMIDs currently assigned to a processor will be tracked by hardware.
> The counters of any other RMIDs which are no longer being tracked will be
> reset to zero. The MBM event counters return "Unavailable" for the RMIDs
> that are not tracked by hardware. So, there can be only limited number of
> groups that can give guaranteed monitoring numbers. With ever changing
> configurations there is no way to definitely know which of these groups
> are being tracked for certain point of time. Users do not have the option
> to monitor a group or set of groups for certain period of time without
> worrying about counter being reset in between.
>
> The ABMC feature provides an option to the user to assign a hardware
> counter to an RMID, event pair and monitor the bandwidth as long as it is
> assigned.  The assigned RMID will be tracked by the hardware until the us=
er
> unassigns it manually. There is no need to worry about counters being res=
et
> during this period. Additionally, the user can specify a bitmask identify=
ing
> the specific bandwidth types from the given source to track with the coun=
ter.
>
> Without ABMC enabled, monitoring will work in current 'default' mode with=
out
> assignment option.
>
> # Linux Implementation
>
> Create a generic interface aimed to support user space assignment
> of scarce counters used for monitoring. First usage of interface
> is by ABMC with option to expand usage to "soft-ABMC" and MPAM
> counters in future.

As a reminder of the work related to this, please take a look at the
thread where Reinette proposed a "shared counters" mode in
mbm_assign_control[1]. I am currently working to demonstrate that this
combined with the mbm_*_bytes_per_second events discussed earlier in
the same thread will address my users' concerns about the overhead of
reading a large number of MBM counters, resulting from a maximal
number of monitoring groups whose jobs are not isolated to any L3
monitoring domain.

ABMC will add to the number of registers which need to be programmed
in each domain, so I will need to demonstrate that ABMC combined with
these additional features addresses their performance concerns and
that the resulting interface is user-friendly enough that they will
not need a detailed understanding of the implementation to avoid an
unacceptable performance degradation (i.e., needing to understand what
conditions will increase the number of IPIs required).

If all goes well, soft-ABMC will try to extend this usage model to the
existing, pre-ABMC, AMD platforms I support.

Thanks,
-Peter

[1] https://lore.kernel.org/lkml/7ee63634-3b55-4427-8283-8e3d38105f41@intel=
.com/
