Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B0D111AD
	for <linux-doc@vger.kernel.org>; Mon,  4 Nov 2024 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730729775; cv=none; b=SaRuIP2CWV3S+Od4XPTRpQaypkSglx8B/pzSb+p2PHnP+hdFDXKlsrixXWXn92A5mFke6GYyakPLkmcVNzivQWBvB2AsZXHrvbHDegOOtiwyNmdGhFmTQAziThRAjBRmERQysXy9DqgPCEtbruj/mDmEQemY50EamUqcxVQUGXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730729775; c=relaxed/simple;
	bh=rxLe7Y9dqzlB+Lxzy1TU9l7LFoc0kg5jLg97h5pT9qI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCZw1u/jGtETRhy//orrOlbZXsMtAzd750fgLwdXVwitahMfoQIhI3s1spOr59uEBs7xVxpviwbWI6rUdD3mHVSPybDXHY6ITsry9wlhwaL7D4TPKNMpOPwdA94SEWl3Z3hnc+OACrTXpsI6yWpE64BVNMbaOwLynbgjDiY3Y1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bQi5W3sx; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bQi5W3sx"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9eaf93e40dso2767266b.0
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2024 06:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730729772; x=1731334572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxLe7Y9dqzlB+Lxzy1TU9l7LFoc0kg5jLg97h5pT9qI=;
        b=bQi5W3sx4hM0DtYGpUlKNcfEFiJ2anS7PHjerpygiADvOpzBBh0ewFe7suMPF/i2Uz
         L98BYATKHdvOCcpiPNtCj2e0A8oGR2YnfLfEd7FPSOotohqBJVKKOznGlPGHGzS6si4t
         q2lLot8C2eT8xehl/q6hbo2UBhggjexZF0F4/5oUt7cmkTh+4BWQEfGGa5Iss55lSHTC
         ZB6hCpx1IE2F8yU+KSdg2OVIWwFJg4Uo1hgeKcAMnUgFbndARKoVdT21Lxd+Y/bngunv
         QJyWL0R5lN1zfycBKFXvBihHYMBzXfhIGC0W9Vt+ynyw8ml/GBLwQIzWh3TzbOCHU+FC
         SdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730729772; x=1731334572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxLe7Y9dqzlB+Lxzy1TU9l7LFoc0kg5jLg97h5pT9qI=;
        b=l1b8v2Fz6qgpBVOdARhJhlwAAwbcDjk2SubXgeb8kRv2gWdxgOT6W+kggv+pasKRI6
         8lOBXP9yS4HHbMi794ZJmz9inEAdtnzNBSYcZ49M3bZ/lmFg1QJ/aU17HBhaNmXfb7ti
         VK4cGQOQCfs6wwaWSYcgOLYZg5eTavU/Hzoehs4Y/YTgLR1u6VNyZdVcJ8CIbtgzzuD7
         Z2BdBkzHdCjHvka35NHMgarCiC24KJEJ2kdQlrX7Aw/DoSiOFCiJ2iLp1fTYnLa2rIuE
         ZP7v3xwAnVw3ddgzmW6j4g2k641w1QoyKV51RXTzBnSc+mROqKQPgarZTF8bv6d797Y7
         gAgg==
X-Forwarded-Encrypted: i=1; AJvYcCWp0/4o9TbOgziuz2sKr4Vc0zlwJNzXqmzjqaLkMM4UQNmjVk5Ix2Z8HgT2XlwRnq7c3P2FsdMaTlM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ1uI4/qbjD/bkXBdwr4ghw9Dj4Q3thY6VjJKJXjqoa0jtQKBq
	eOJLNmLxpQSSBo+rqUb3nYBa7n9/oMQ/QJmGYso9w9Lxjj+hb5knctB8BgIJKZkJDVUldO7DDE4
	MUKW4Q1mec6f84KO4ENjBoF+reRDuvqszrNGy
X-Google-Smtp-Source: AGHT+IEQp7CxSTcIpzbhac/Om/w+DYXGFRp4tTHPbDjHlSeM3TjAN+8VSUdY2j7RPrLZVT6+CnlfSBSnLTMAkCgEvdc=
X-Received: by 2002:a17:907:94cd:b0:a9a:230b:fb5e with SMTP id
 a640c23a62f3a-a9de5d6eb83mr3029233366b.4.1730729771530; Mon, 04 Nov 2024
 06:16:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1730244116.git.babu.moger@amd.com> <d27c3a15ccb11c6ba76794eba6cf7c013b0bb074.1730244116.git.babu.moger@amd.com>
In-Reply-To: <d27c3a15ccb11c6ba76794eba6cf7c013b0bb074.1730244116.git.babu.moger@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Mon, 4 Nov 2024 15:16:00 +0100
Message-ID: <CALPaoCh1BWdWww8Kztd13GBaY9mMeZX268fOQgECRytiKm-nPQ@mail.gmail.com>
Subject: Re: [PATCH v9 19/26] x86/resctrl: Add the interface to unassign a MBM counter
To: Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, reinette.chatre@intel.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com, thuth@redhat.com, 
	paulmck@kernel.org, rostedt@goodmis.org, akpm@linux-foundation.org, 
	xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com, 
	daniel.sneddon@linux.intel.com, perry.yuan@amd.com, sandipan.das@amd.com, 
	kai.huang@intel.com, xiaoyao.li@intel.com, seanjc@google.com, 
	jithu.joseph@intel.com, brijesh.singh@amd.com, xin3.li@intel.com, 
	ebiggers@google.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com, 
	james.morse@arm.com, tan.shaopeng@fujitsu.com, tony.luck@intel.com, 
	vikas.shivappa@linux.intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com, 
	eranian@google.com, jpoimboe@kernel.org, thomas.lendacky@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Wed, Oct 30, 2024 at 12:25=E2=80=AFAM Babu Moger <babu.moger@amd.com> wr=
ote:
>
> The mbm_cntr_assign mode provides a limited number of hardware counters
> that can be assigned to an RMID, event pair to monitor bandwidth while
> assigned. If all counters are in use, the kernel will show an error
> message: "Out of MBM assignable counters" when a new assignment is
> requested. To make space for a new assignment, users must unassign an
> already assigned counter.
>
> Introduce an interface that allows for the unassignment of counter IDs
> from both the group and the domain. Additionally, ensure that the global
> counter is released if it is no longer assigned to any domains.

This seems unnecessarily restrictive. What's wrong with monitoring
different groups in different domains?


-Peter
