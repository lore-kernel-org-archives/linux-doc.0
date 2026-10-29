Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793255381;
	b=ERzcb9T8zobFMgqvuSXVXi4fg5yViuYf+IIWB46w5oROJpXLHMCy0Dz3qqmafSX3wU8w
	 /QsaUAyyS1dZwoQYy7ZBLSeuSioMNcGq8WsV5py7rJ1O2cbzDMEEpM0GbWRJQFOpBOTb+
	 qKbs/ldJGSUhdXXMtqfleOX3gsGgYE2ZmcWnlJOKhu59UiUcV+cUImehoAnkJHS1hEPjW
	 ZUnjwUnOsaQ5yu3Dh4M4isZwL5WDHmKUdwnWa0KMrRRHtDqFqCnmM1/0iyrESC+j27lK+
	 z2+GRsYUsXVFR4qSwFApra+vMhmylCiRqcSxe328yWhJCjzixy/jnUsRnIpsjJlgMCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793255381;
	h=DMARC-Filter:DKIM-Signature:Cc:From:References:X-Original-From:
	 In-Reply-To:Subject:Message-Id:X-Lms-Return-Path:
	 Content-Transfer-Encoding:User-Agent:Mime-Version:To:Date:
	 Content-Type;
	bh=LSpsxZ0UOcO2qaOwszBPuySwWt2HOSaZ4drFli6RZ2s=;
	b=T9VvyXj8hybMp0njKMYkVgQpwg6QLp7X7rK75CbRi1f5K+hoc8+XMZcRWl8os5BU+IoA
	 2BVmK/5JIBFu61IXkUniqBvZgWQDmX/7rAQ8TM0ikXPBJ3TEz0tOeL/BC8rpCVMZPHk5Q
	 7n5wEuSZwohr4A7dlQvO1kt9VZTCEU19poYRjCMZzaKvcdfWlnQsjM8u713lwCJ0xhHyc
	 p949kWmvoix0B54YygnKv8zn5m6Mws0JwfQdHJRxFuU0iQM9oTiiC7En5A+fsHEDgQKWS
	 bsPGhOGoUgDYJ1h00KhDYXSWeS3fEOXnOO8QX3XdSusqxP8HrP+uxOCck+O/n7sbClw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=SWxxW4lJ;
	arc=none smtp.remote-ip=209.127.231.114
Received: from va-2-114.ptr.blmpb.com (va-2-114.ptr.blmpb.com [209.127.231.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536FB606A31A
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 06:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 536FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=SWxxW4lJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793255370; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=LSpsxZ0UOcO2qaOwszBPuySwWt2HOSaZ4drFli6RZ2s=;
 b=SWxxW4lJrbz9WGHaQQdDbYHk6CtxBs6AVHOz/tfi967QnVoYvku5CKRTq54q2NSpdK8rJx
 uvu0Rc7nEysZMOx5g0C+1U1ebXLucQUGHXl1EgAHY8dTj0OalC/HpdiOHdeYCsJWCRi1Gl
 7LZh2HJt/8lQuq+o8pHwEpBh6chveJffti88zP6UrHdDCW9mjVZamxDVDe1ibtXPmpFqPT
 yCftoUXDipbE/JaMD9KdukA0iulVxd7xYP685DHWq/XzPJeb9uLe/njzxJOVFBUPNbwklS
 I4y86nRxP5nB/cpMy8fW9n2hhjFv/OmtDAtAhIFixdlHni0O4TdLRAKmFuZWHg==
Cc: <akpm@linux-foundation.org>, <bsegall@google.com>, <david@kernel.org>, 
	<dietmar.eggemann@arm.com>, <gourry@gourry.net>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <rostedt@goodmis.org>, 
	<vincent.guittot@linaro.org>, <vschneid@redhat.com>, <ziy@nvidia.com>, 
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>,  "Huang,  Ying" <ying.huang@linux.alibaba.com>, 
	<riel@surriel.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
References: <20261028041253.74839-1-lizhe.67@bytedance.com> <20261028041253.74839-3-lizhe.67@bytedance.com> <CAN+CAwPM=-sRDypP0+ZxX8_CziBRjXbxKEE3UZGLzkmOWrajNg@mail.gmail.com> <8d6f589c-4427-465d-be5a-17eb99f41a91@amd.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
In-Reply-To: <8d6f589c-4427-465d-be5a-17eb99f41a91@amd.com>
Subject: Re: [PATCH v2 2/3] sched/numa: do not feed tiering promotions into task placement stats
Message-Id: <49e49011-45c1-4eef-84fa-96bd2de701c9@bytedance.com>
X-Lms-Return-Path: <lba+26ae2e7c8+6519e4+vger.kernel.org+lizhe.67@bytedance.com>
Content-Transfer-Encoding: quoted-printable
User-Agent: Mozilla Thunderbird
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
To: "Bharata B Rao" <bharata@amd.com>, 
	"Joshua Hahn" <joshua.hahnjy@gmail.com>
Date: Thu, 29 Oct 2026 14:29:02 +0800
Content-Type: text/plain; charset=UTF-8

On 10/29/26 1:51 PM, Bharata B Rao wrote:
> On 28-Oct-26 8:33 PM, Joshua Hahn wrote:
>> On Wed, Oct 28, 2026 at 12:14=E2=80=AFAM Li Zhe <lizhe.67@bytedance.com>=
 wrote:
>>> NUMA balancing has separate mode bits for normal task placement and
>>> memory tiering. In memory-tiering-only mode, NUMA hinting faults on
>>> slow-tier pages are used to detect hot pages and promote them to a top
>>> tier. They are not normal task-placement faults.
>>>
>>> For slow-tier folios, memory tiering reuses the folio last-cpupid field
>>> to store access-time metadata. numa_migrate_check() therefore cannot
>>> return a real cpupid for those faults. Before this change, it returned =
the
>>> same all-ones last_cpupid value that normal AutoNUMA uses for a first o=
r
>>> unknown access.
>>>
>>> That can make a memory-tiering-only promotion look like an ordinary fir=
st
>>> private AutoNUMA fault. After a successful promotion, do_numa_page()
>>> reports the target top-tier node to task_numa_fault(), so the existing
>>> slow-node skip no longer applies. task_numa_fault() then accounts the
>>> fault in p->numa_faults and p->numa_faults_locality, and
>>> task_numa_placement() can consume that sample to update normal task
>>> placement state even though normal NUMA balancing is disabled. In other
>>> words, hot-page promotion feedback can leak into the CPU placement
>>> heuristic.
>> Hi Zhe,
>>
>> Thanks for the revision. To me, this looks more like a fix than an
>> optimization, since there really is incorrect NUMA balancing behavior
>> happening that could be visible in userspace (unintended
>> task-placement and related accounting). On the other hand patch 3/3
>> doesn't seem like a fix to me despite the name, since this one would
>> mitigate the incorrect behavior.
>>
>> How about we pull this one out of the series and submit it
>> independently with an appropriate Fixes: tag and cc:stable, and
>> discuss 1 and 3 later on?
> Currently only successful promotions feed stats to scan period update.
> This change stops that and nothing updates the scan period for tiering
> mode after this change.
>
> Though the direction of the fix is right, I think this can't be an
> independent fix until there is some alternative which patch 3 in this
> series brings in.
Agreed, thanks for pointing this out.=C2=A0 Patch 2 should not be sent as a
standalone fix without the replacement scan-period feedback path.

Thanks,
Zhe

>
> Also it would be good to get a view from Ying Huang as to why only
> successful promotions drove the fault stats while unsuccessful promotions
> didn't in the tiering mode.
>
> Regards,
> Bharata.
