Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FD614A8E;
	Mon, 29 Dec 2025 21:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767043299; cv=none; b=En5Yy5WMGWoELKmDdj3KTAy/q8lE/Rmx564ts0oNgW+aRdUupOXKWDB6xBRDMOvKEU8YYAXuEk+FJIYbsV7a5kuBXUJoWyl9QljntwMOmJwAa3xxbaxUK8DnM1LgTzEKGTn/okzNiwNFsfXtVQNq5+Yng5WxHSph/B9+Y5Fd5OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767043299; c=relaxed/simple;
	bh=Fy6E0Djyl440LbC4IsN3A4KkNoyDnp/oyxzUqc5PaTs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BAse6A04W6kLnVzMOpoL5gNEO4bs8v5yd58TN1hYuM7BIVIvo5Z2OEeEoGzqPkh3+VqxoV5c3bHc7Os642C3UIfRyH+nEuQkMcswCrntfd8ddSJi69JRjoSCMQ8FcX+1ahorCLo/CFtDHTS7JciD+zsew3cLSgo4IqvxXCilb+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnicmMwn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnicmMwn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B153C4CEF7;
	Mon, 29 Dec 2025 21:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767043299;
	bh=Fy6E0Djyl440LbC4IsN3A4KkNoyDnp/oyxzUqc5PaTs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bnicmMwnC8Hz+Av7KUh2lvvxIjCzkBDY/wzSKfrzAyvWuKx1NSG9v8jBEtVzSsX3w
	 rwdxxewgywMsoi1ZrGqKx7F7AikHrXQOnfXgj7xngJrBzXoBO4L0Yiu8vkGfpHHjPR
	 3aF0hR53w77goVJU+qbgq+wJL8JUqj4vs3mfxermslBt/VCOrYeFStvIc9Un7/Aa7L
	 3dgAwFcsTgU7uKfxheS2cHtjtYbURNI/oaSs90kbX/FvpZa2wNQTL/0JTextbhpjZn
	 JMvHCDLcQwJSdwx3dOqwIZ1A0xUryUeCx+BbhDS7BMH50ZX358EnPNpat75V81nPY3
	 CZPwpD4Tn3v/w==
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
Subject: Re: [RFC PATCH 06/10] liveupdate: hugetlb subsystem FLB state
 preservation
In-Reply-To: <CA+CK2bAVuHG1cVPQz8Wafe8o2TtitrqJjqfHOT7Xun=zWMoo2Q@mail.gmail.com>
	(Pasha Tatashin's message of "Tue, 23 Dec 2025 13:15:31 -0500")
References: <20251206230222.853493-1-pratyush@kernel.org>
	<20251206230222.853493-7-pratyush@kernel.org>
	<CA+CK2bAVuHG1cVPQz8Wafe8o2TtitrqJjqfHOT7Xun=zWMoo2Q@mail.gmail.com>
Date: Mon, 29 Dec 2025 22:21:29 +0100
Message-ID: <86qzsd7zmu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23 2025, Pasha Tatashin wrote:

> On Sat, Dec 6, 2025 at 6:03=E2=80=AFPM Pratyush Yadav <pratyush@kernel.or=
g> wrote:
>>
>> HugeTLB manages its own pages. It allocates them on boot and uses those
>> to fulfill hugepage requests.
>>
>> To support live update for a hugetlb-backed memfd, it is necessary to
>> track how many pages of each hstate are coming from live update. This is
>> needed to ensure the boot time allocations don't over-allocate huge
>> pages, causing the rest of the system unexpected memory pressure.
>>
>> For example, say the system has 100G memory and it uses 90 1G huge
>> pages, with 10G put aside for other processes. Now say 5 of those pages
>> are preserved via KHO for live updating a huge memfd.
>>
>> But during boot, the system will still see that it needs 90 huge pages,
>> so it will attempt to allocate those. When the file is later retrieved,
>> those 5 pages also get added to the huge page pool, resulting in 95
>> total huge pages. This exceeds the original expectation of 90 pages, and
>> ends up wasting memory.
>>
>> LUO has file-lifecycle-bound (FLB) data to keep track of global state of
>> a subsystem. Use it to track how many huge pages are used up for each
>> hstate. When a file is preserved, it will increment to the counter, and
>> when it is unpreserved, it will decrement it. During boot time
>> allocations, this data can be used to calculate how many hugepages
>> actually need to be allocated.
>>
>> Design note: another way of doing this would be to preserve the entire
>> set of hugepages using the FLB, skip boot time allocation, and restore
>> them all on FLB retrieve. The pain problem with that approach is that it
>> would need to freeze all hstates after serializing them. This will need
>> a lot more invasive changes in hugetlb since there are many ways folios
>> can be added to or removed from a hstate. Doing it this way is simpler
>> and less invasive.
>>
>> Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
>> ---
>>  Documentation/mm/memfd_preservation.rst |   9 ++
>>  MAINTAINERS                             |   1 +
>>  include/linux/kho/abi/hugetlb.h         |  66 +++++++++
>>  kernel/liveupdate/Kconfig               |  12 ++
>>  mm/Makefile                             |   1 +
>>  mm/hugetlb.c                            |   1 +
>>  mm/hugetlb_internal.h                   |  15 ++
>>  mm/hugetlb_luo.c                        | 179 ++++++++++++++++++++++++
>>  8 files changed, 284 insertions(+)
>>  create mode 100644 include/linux/kho/abi/hugetlb.h
>>  create mode 100644 mm/hugetlb_luo.c
>>
[...]
>> +static int hugetlb_flb_retrieve(struct liveupdate_flb_op_args *args)
>> +{
>> +       /*
>> +        * The FLB is only needed for boot-time calculation of how many
>> +        * hugepages are needed. This is done by early boot handlers alr=
eady.
>> +        * Free the serialized state now.
>> +        */
>
> It should be done in this function.

The calculations can't be done in retrieve. Retrieve happens only once
and for the whole FLB. They will need to come from
hugetlb_hstate_alloc_pages().

Maybe you mean getting rid of liveupdate_flb_incoming_early()? Yeah,
that I can do. It will make this function a no-op once we move the
kho_restore_free() to finish().

>
>> +       kho_restore_free(phys_to_virt(args->data));
>
> This should be moved to finish() after blackout.

Sure.

>
>> +
>> +       /*
>> +        * HACK: But since LUO FLB still needs an obj, use ZERO_SIZE_PTR=
 to
>> +        * satisfy it.
>> +        */
>> +       args->obj =3D ZERO_SIZE_PTR;
>
> Hopefully this is not needed any more with the updated FLB, please check =
:-)

Yep. IIRC when I sent this series the older version of FLB was in
mm-nonmm-unstable.

>
>> +       return 0;
>> +}
>> +
[...]

--=20
Regards,
Pratyush Yadav
