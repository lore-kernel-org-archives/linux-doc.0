Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6566735B62C
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 19:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293842; cv=pass; b=Z8gA6yuumL3DVuQKSWFOBfCJVzZzYdlZj8nvzdmx+/iriDfEP8Uu/ptD8iOy1xE/b5OhFSrHfmMljnmUvarrQHgJgwGapWfOFfuxakocqy4T67+ovf/CHqD+f+kOUMacUBm4FuGtgTn6sc60/ZX/8wcQHJYImol6k2CkNdsDT4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293842; c=relaxed/simple;
	bh=sNMO+7JAtwKOL0cGOSgwp9po6bAqn+s7JRlEOufnWaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oLyc+OSuqaGjiB1w+hP4vfn6DO/yPzaTpTpLUbLfo4v4UI5QTnHRQDINXaiyC6hBHPtNztReyD1zSC71cQkj1+gFA2C3seDAcGIGDaipzr/q7OMVlIanyrsf2miU9d6o0N1eqsWdfoVbuAixv7jAzbO6CgyQJYlAs366I03gHk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlK9BXIp; arc=pass smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlK9BXIp"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-12a71ade78cso680652c88.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 12:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774293840; cv=none;
        d=google.com; s=arc-20240605;
        b=NRVdqFBqfZsMkhR5+mHgPws73oAG4+deQb6xqfOzrJ7dqsKesqW6iX8vz2LrSr97GW
         tXLnoaz/p/UtBXY/z/01iBXsdh8X0oN7kAiiWRC9PaLLfWjrgLs67ZY5THaAu1jJNX3T
         ntdb/KJmYjDhBIgGycmu3usDATDsSCtJ9UN1bF/L/bWBp/GnoWGTDv1zUs35JFWYupwz
         FmyGQJJOGlZu71Kr8u08JXF4ygVQ+BUoTZMOHFiuWi4tWeDn4sH1vgisLugGxlyiTox7
         IMuTZCgiX7vgsVy7Ebubpu0tUDGYwDh3BlkF8R7erpqoIObuMQNWEoDnWOByGTUfyPmK
         M46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kd/Ap1nB3+5l9lLzCyst0NQXC8reE8pKqs/t9xxDzCM=;
        fh=GADfVz86yEkIn/x3wlBYvpDNwPZ2ijL3S2yDTa75cDA=;
        b=KcY8jvgJ/DVXW3nNs40sXubw4z+RMuJkahNBhCnwFQRPBulx/dB82mvxFfLuuYtE5u
         xrBvpV9BjdBuA7xMpC0W1kFuj57qf0WZHSvQReP9y9l2fzhWAzssF9kDRcVivxjkCR75
         LV0v02b6FzjtJfWhJJDYu1dou6aonSa0YOhsDL9wHl+/FGJD4/+5Al8fu4awGrBLY6nd
         p6JlP8VEXWzav4GTywdGU5p0aYEsbormxozHbFcMqIV+TeKcghgEnAeHSlDwb2shHrkh
         Y+iPSQhZwpEy60YyvdH2RaQNNCRQCUV0D+kcmZeRMKJsYDxUZW9HsW8NKeqW6opZF2GQ
         ynDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774293840; x=1774898640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kd/Ap1nB3+5l9lLzCyst0NQXC8reE8pKqs/t9xxDzCM=;
        b=IlK9BXIpEejQt7noh6tXonuQ1LoN+7uMfkIW+MVTV7qflZuonB6AidOgyQUrinbNAu
         PLHfgabvSwoadBlhlxmlGfPKunlRM6QpZBQTgDMrGrtDrx8m3yv8QxUtRv43NFHdKK54
         ZE6StB2kZOCayRWwA+9UHA0n1dHAIz7WaMmKK7iOEPqd3/sLdk/H/COadVqTGuZHEaoA
         p+IGzU7B4ycchjyV2j2naUFaIBeDfymRiwtzvgguip24qAcSsGhpTv4D8ij1WI0AjVgE
         BXva0+Z092OPMJlEqJXgHWJ2ZRTM2ULnFnTVgwgmnkleDT1G7QKlnRj5ZalJADIIvGoz
         L4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293840; x=1774898640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kd/Ap1nB3+5l9lLzCyst0NQXC8reE8pKqs/t9xxDzCM=;
        b=q8lcenJUktaD+bEUZxxEb5v+KWt/vkSGqJ1ygRzPRxctDggLGwlMc3KA+3ASsYV5+J
         sN/bKaXnlvzO5sHZERl6uXKjfp+QXx/8B2QaNSmjI3P/pUt80OP93qE3a6/oiz4gY1f2
         n5pFhokB0zLTrxV6ts7rAIttzPXy5N48CHM/YMtacsBrp56AfIx9LjoEAsWyftpFIxNO
         OuIor9NmSixq6v3y2RnW0RwrJZ1T24gT5YbhpvbK/Zsy29sEqw8+ZG/AqcCphxwecCs1
         x5hRVGZIsJTBRulgORn/ZX0d0rd1GletR7p+6GuNBhmco8CNbIK+dZ6OnpomC2iGW3vH
         mT1g==
X-Forwarded-Encrypted: i=1; AJvYcCW3zaJGHJ57q4xfiAFzO7oLOMg6d1bNbt170QhMq4oN/MrxGxkWlTcih1TlhzkJftmadLi1oBBmo/A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz96uc2wefQOHOD6+6TXp5uaOCqsiw7dd2FnViIDLKVpYDwV5KB
	jijsWbIEb1uMTcbYxoJ9PhJJBcHGduujJdHVG79Nfr/D5L9urfF7qZpDO/6S/aOoatDD0w9PzR1
	aJDU4H/jp5lEPIdH20ThhUv1MJ7Mp/w==
X-Gm-Gg: ATEYQzyh1qQxaroRXP6SupP7Qqykj2wTk3Z2ggKFXis8b53OlXV+wmC+428mzcVLZoU
	65FlImPOK4YkWB4cQT/pteO2LSOrjG4RSOqJztFzI5nLem5TybUbWRf6XZGndCuf4I+BBNx7SMs
	6VKuAPAzaTuq7SCuWK4fiQlwx8WMnQOuhKRIoe/ISxjADwbkmRxG2GHiJ2TiLJMGaL/S8SKoIr+
	irHmhNPLHlNQyHkq1CAsR+Mn+vjNUsEKuMewn++yOr9aM5sLSpezFTvysPRpIeW7hqJANLNCZzL
	VUz/0I8=
X-Received: by 2002:a05:7022:2507:b0:123:3500:b688 with SMTP id
 a92af1059eb24-12a726dc4a9mr5332008c88.19.1774293840376; Mon, 23 Mar 2026
 12:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320190453.1430-1-ravis.opensrc@gmail.com> <20260321165746.84394-1-sj@kernel.org>
In-Reply-To: <20260321165746.84394-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Mon, 23 Mar 2026 12:23:49 -0700
X-Gm-Features: AaiRm53G1dtITD6OPSmNFBca8dgCST3mqTjoCxapaAIAN1uqhVUWdPIlUbgjZ-w
Message-ID: <CALa+Y15sBCyVgGKC5994-WhS31nahyT=8uitDPG_isZ7sp_g_w@mail.gmail.com>
Subject: Re: [RFC PATCH v4 0/1] mm/damon: add node_eligible_mem_bp and
 node_ineligible_mem_bp goal metrics
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 9:57=E2=80=AFAM SeongJae Park <sj@kernel.org> wrote=
:
>
> Hello Ravi,
>
>
> Thank you for this patch!  TL; DR: Other than trivial things I commented =
below
> and to the patch, I believe it is time to drop the RFC tag, and work on m=
erging
> this.
>

Thanks, SJ, for the prompt and detailed feedback!

> On Fri, 20 Mar 2026 12:04:52 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail=
.com> wrote:
>
> > This patch introduces two new DAMON quota goal metrics for controlling
>
> s/DAMON/DAMOS/ ?
>

Will fix it.

> > memory distribution in heterogeneous memory systems (e.g., DRAM and CXL
> > memory tiering) using physical address (PA) mode monitoring.
> >
> > v3: https://lore.kernel.org/linux-mm/20260223123232.12851-1-ravis.opens=
rc@gmail.com/
>
> The above link would better to be put on 'Chage since v3' section below.
>

Got it. Will take care of it next time.

> >
> > Changes since v3:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > - The first two patches from v3 (goal_tuner initialization fix and
> >   esz=3D0 quota bypass fix) are now in damon/next. This submission
>
> It is not also in mm-unstable :)

Good to know. Will mention this in the next version.

>
> >   contains only the core metrics patch, rebased on top of those fixes.
> >
> > - Simplified implementation: removed per-node eligible_bytes array, now
> >   iterates scheme-eligible regions directly for each goal evaluation.
> >
> > - Handle regions crossing node boundaries: uses damon_get_folio() to
> >   determine actual NUMA node placement of each folio rather than
> >   assuming uniform node placement within a region.
> >
> > - Pass scheme pointer directly to metric calculation functions, avoidin=
g
> >   container_of() derivation from quota pointer.
> >
> > - Fixed 80-column wrapping issues.
>
> Thank you for addressing all my comments!
>
> >
> > Background and Motivation
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >
> > In heterogeneous memory systems, controlling memory distribution across
> > NUMA nodes is essential for performance optimization. This patch enable=
s
> > system-wide page distribution with target-state goals like "maintain 30=
%
> > of scheme-eligible memory on CXL" using PA-mode DAMON schemes.
> >
> > What These Metrics Measure
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >
> > node_eligible_mem_bp:
> >     scheme_eligible_bytes_on_node / total_scheme_eligible_bytes * 10000
> >
> > node_ineligible_mem_bp:
> >     (total - scheme_eligible_bytes_on_node) / total * 10000
> >
> > The metrics are complementary: eligible_bp + ineligible_bp =3D 10000 bp=
.
> >
> > Two-Scheme Setup for Hot Page Distribution
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > For maintaining 30% of hot memory on CXL (node 1):
>
> I think it could help easy reading if the above sentence also explains
> node 0 is DRAM.  For example,
>
> For maintaining hot memory on DRAM (node 0) and CXL (node 1) in 7:3 ratio=
:

Good suggestion, will clarify the node mapping.

>
> >
> >     PUSH scheme: migrate_hot from node 0 -> node 1
> >       goal: node_ineligible_mem_bp, nid=3D0, target=3D3000
> >       "Push hot pages out until 30% of hot memory is NOT on DRAM"
>
> Seems the sentence assumes the actor is in DRAM.  It was not very clear t=
o me.
> How about making it clear?  E.g.,
>
> "Move hot pages from DRAM to CXL, if more than 70% of hot data is in DRAM=
"

Got it. Will use your suggested wording.

>
> >
> >     PULL scheme: migrate_hot from node 1 -> node 0
> >       goal: node_eligible_mem_bp, nid=3D0, target=3D7000
> >       "Pull hot pages back until 70% of hot memory IS on DRAM"
>
> If the above example is good for you, to be consistent with it, how about
> rewording like below?
>
> "Move hot pages from CXL to DRAM, if less than 70% of hot data is in DRAM=
"

Agreed. Will reword this too.

>
> >
> > The complementary goals create a feedback loop that converges to the
> > target distribution.
> >
> > Dependencies
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > This patch is based on SJ's damon/next branch which includes the
> > TEMPORAL goal tuner required for these metrics.
>
> Your test might be depend on the feature.  But this patch series itself i=
s not,
> as users could also use it with CONSIST tuner?
>

Correct, the metrics work with both tuners. Will reword to clarify that
testing used TEMPORAL but the patch itself does not depend on it.

> Also, as I mentioned above, the feature is now also in mm-unstable tree.
>
> >
> > Testing Results
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Functionally tested on a two-node heterogeneous memory system with DRAM
> > (node 0) and CXL memory (node 1). Used PUSH+PULL scheme configuration
> > with migrate_hot action to maintain a target hot memory ratio between
> > the two tiers.
> >
> > With the TEMPORAL goal tuner, the system converges quickly to the targe=
t
> > distribution. The tuner drives esz to maximum when under goal and to
> > zero once the goal is met, forming a simple on/off feedback loop that
> > stabilizes at the desired ratio.
> >
> > With the CONSIST tuner, the scheme still converges but more slowly, as
> > it migrates and then throttles itself based on quota feedback. The time
> > to reach the goal varies depending on workload intensity.
>
> Sounds reasonable!
>
> Do you plan to further evaluate some performance metrics?  I'd not strong=
ly
> request that, but it would be very nice if we can have that.
>

Yes, I am planning to run additional tests. I will send v5 addressing
all the review comments and dropping the RFC tag. Results will follow
as the testing progresses.

> Regardless of your answer to the above question, I think the current code=
 and
> the test is good enough to consider merging this.  I suggest dropping the=
 RFC
> tag from the next spin.
>
> Thank you for doing this, Ravi!
>

Thank you! Will drop the RFC tag for v5.

>
> Thanks,
> SJ
>

Best Regards,
Ravi.

> [...]
