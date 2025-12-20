Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB41242D67;
	Sat, 20 Dec 2025 03:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766201175; cv=none; b=Kh/hdYK3oER9w6lIsACta+5l39gn5gn/xfdq/oZIHkZO4c6oDfY7iF2GKtLhYmWmwN+2Pib+hzd6exraoOWCU5Irqldxiod71KuyuBLoUosXdK1+P4v3r65Ie/vIgh0d/F9FAx+2OjeiixOVgsM0s+05DeeoeQ+E+aiLQ68MHZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766201175; c=relaxed/simple;
	bh=EnAo8tjl0LeLPwSTVsKJgQguKuTTfJq16l9GOU0BmgI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JpmVByQ2Q7IMzHlHQ853dreydeVS0VUZuGUfc3E2ViuGwOmE2BfzrkdHa+nolo7PoY5UvaGHR+aC5nt4DpT+ztQlBnGGW2jhcV7QENOcLBKzYreTur09xLQsJJp/bUn4ZR0ucfqr9HuCj5bo2vAAQRz5xgsaQfcvfJxNk1Qatoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=phms4Nd6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phms4Nd6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15A2C4CEF5;
	Sat, 20 Dec 2025 03:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766201175;
	bh=EnAo8tjl0LeLPwSTVsKJgQguKuTTfJq16l9GOU0BmgI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=phms4Nd6aQSaSqIIrs7tdFGtUthysBdYR/4KUwsLEko27qXKr9jeITU/Y660l86gX
	 dnDJBEWToNz9fEG6IGkuV7uKzIcIKzTF5pnuo52ubwmGMfSHDV4Ab5LQetAx4dhYLU
	 DQCPur2SWniNGSj6O0YbWfGGYPomemOaisSZyoDKGQhG5uF6ymmvwXdf4cdLCrYrFe
	 gUtTS33mU/WNSQKk+AeI/8T1+lFeukh+B5DmNx6bFr1a6ihStU+lxVih2azmbAVTie
	 hS9hWVFX2ObIMZWnGz4wektpS41jHSJ8W+XdOE2HhKwLgZcUrfbZI7EeUm7LkphO5S
	 Y5ZiABDTgnitQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Mike Rapoport <rppt@kernel.org>,
  Andrew Morton <akpm@linux-foundation.org>,  David Hildenbrand
 <david@kernel.org>,  Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,  "Liam
 R. Howlett" <Liam.Howlett@oracle.com>,  Vlastimil Babka <vbabka@suse.cz>,
  Suren Baghdasaryan <surenb@google.com>,  Michal Hocko <mhocko@suse.com>,
  Jonathan Corbet <corbet@lwn.net>,  Thomas Gleixner <tglx@linutronix.de>,
  Ingo Molnar <mingo@redhat.com>,  Borislav Petkov <bp@alien8.de>,  Dave
 Hansen <dave.hansen@linux.intel.com>,  x86@kernel.org,  "H. Peter Anvin"
 <hpa@zytor.com>,  Muchun Song <muchun.song@linux.dev>,  Oscar Salvador
 <osalvador@suse.de>,  Alexander Graf <graf@amazon.com>,  David Matlack
 <dmatlack@google.com>,  David Rientjes <rientjes@google.com>,  Jason
 Gunthorpe <jgg@nvidia.com>,  Samiullah Khawaja <skhawaja@google.com>,
  Vipin Sharma <vipinsh@google.com>,  Zhu Yanjun <yanjun.zhu@linux.dev>,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org,
  linux-doc@vger.kernel.org,  kexec@lists.infradead.org
Subject: Re: [RFC PATCH 04/10] liveupdate: flb: allow getting FLB data in
 early boot
In-Reply-To: <CA+CK2bAV1y_LySjyj-wcn1cdSuVBdC+r+zQL7AQTY64nk3OxuQ@mail.gmail.com>
	(Pasha Tatashin's message of "Thu, 18 Dec 2025 13:25:32 -0500")
References: <20251206230222.853493-1-pratyush@kernel.org>
	<20251206230222.853493-5-pratyush@kernel.org>
	<CA+CK2bAV1y_LySjyj-wcn1cdSuVBdC+r+zQL7AQTY64nk3OxuQ@mail.gmail.com>
Date: Sat, 20 Dec 2025 12:26:05 +0900
Message-ID: <86wm2hj0ky.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18 2025, Pasha Tatashin wrote:

> On Sat, Dec 6, 2025 at 6:03=E2=80=AFPM Pratyush Yadav <pratyush@kernel.or=
g> wrote:
>>
>> To support hugepage preservation using LUO, the hugetlb subsystem needs
>> to get liveupdate data when it allocates the hugepages to find out how
>> many pages are coming from live update. This data is preserved via LUO
>> FLB.
>>
>> Since gigantic hugepage allocations happen before LUO (and much of the
>> rest of the system) is initialized, the usual
>> liveupdate_flb_get_incoming() can not work.
>>
>> Add a read-only variant that fetches the FLB data but does not trigger
>> its retrieve or do any locking or reference counting. It is the caller's
>> responsibility to make sure there are no side effects of using this data
>> to the proper retrieve call that would happen later.
>>
>> Refactor the logic to find the right FLB in the serialized data in a
>> helper that can be used from both luo_flb_retrieve_one() (called from
>> luo_flb_get_incoming()), and from luo_flb_get_incoming_early().
>>
>> Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
>> ---
>>  include/linux/liveupdate.h  |  6 ++++
>>  kernel/liveupdate/luo_flb.c | 69 +++++++++++++++++++++++++++++--------
>>  2 files changed, 60 insertions(+), 15 deletions(-)
>>
>> diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
>> index 78e8c529e4e7..39b429d2c62c 100644
>> --- a/include/linux/liveupdate.h
>> +++ b/include/linux/liveupdate.h
>> @@ -232,6 +232,7 @@ int liveupdate_unregister_flb(struct liveupdate_file=
_handler *fh,
>>
>>  int liveupdate_flb_get_incoming(struct liveupdate_flb *flb, void **objp=
);
>>  int liveupdate_flb_get_outgoing(struct liveupdate_flb *flb, void **objp=
);
>> +int liveupdate_flb_incoming_early(struct liveupdate_flb *flb, u64 *data=
p);
>
> Hi Pratyush,
>
> [Follow-up from LPC discussion]
>
> This patch is not needed, you can use liveupdate_flb_get_incoming()
> directly in early boot. The main concern is that we take mutex in that
> function, but that I think is safe. The might_sleep() has the proper
> handling to be called early in boot, it has "system_state =3D=3D
> SYSTEM_BOOTING" check to silence warning during boot.

Right. I will give it a try. For hugetlb, this works fine since it
doesn't really need to do much in FLB retrieve anyway, it just needs to
parse some data structures.

If other subsystems end up needing a two-part retrieve, one in early
boot and one later, then I think it would be a good idea to model that
properly instead of leaving it up to the subsystem to manage it.

Anyway, that isn't a real problem today so let's look at it when it does
show up.

--=20
Regards,
Pratyush Yadav
