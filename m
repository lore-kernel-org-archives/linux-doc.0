Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF73824C076
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071115; cv=pass; b=SbX2DRf3rI2BrZPRLF71e6FDmWHwOaDXF99PQlNMnz9P1p6tLtRG1CeN4MHx3FEZ68KNncMZ842W9Wuv5tfEXr+bkcOL8hwrK259yojSc9xD143V5tB8MJXbj9ZdAwS7MuWJrs9R7fNnXvFTOQY1tjBgRX2oarAjXFymaJyKKZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071115; c=relaxed/simple;
	bh=FQ+rfw6YSM+Ur2t0O+8S8EZHYkkVvAytEeux3uABvPk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r2K0SLwR0aTbNKsKJwE/+JDOSftvaseIQzhG3S97ghS7U3VYmtm5x4RIczK1YXjXah8zt8TNNbnlbn/NG6OxwM5F5TJ97FYRVz+WF575m3hNlc79rUTQRcuZFRHJaOXQoMNMLAI26r4s6Y1JwaihefFpYL9SjMHYQpET0NDz+zQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xI5mH1Ok; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xI5mH1Ok"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ffabb1dfbaso3107260137.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 08:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773071112; cv=none;
        d=google.com; s=arc-20240605;
        b=BZGScxIUqVL5ChSI0IfFPbYy3cxfBQzC2jBdmHKINoZDYlCE3T2ZyGa5Ir8cS9rn6y
         A796ptpAnle6cJyOMkgVAWcj/7dwbmVwwY3KEpdQlaJxqQEUmeIVOYm3uuL3qLNBldyM
         YJ45AVIs21WWWGmYPX8mfpNxNHQ/340yajbQmVy5fNHZNTOhM1i5ZE4nyYolutoVPMZM
         ztjuqdny0cRAnUoUNCy/Xp7GtZREW9pX5z8YJgYB4duGoCLbJ+vMYk5jTDWaaVR5/OlM
         6BMxpFRX9HadSPFfYGl1N+w0lrofnRQHNXyusRBYvVSDKPWcf/0xDbKzyWvsQSzw/UWX
         KWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=bKp7UfWwsR+Qtr2/5qSzMlZ35ZQUtFxqOaPiGk/f9/o=;
        fh=O/QkMWLp7Ze2mFYNNBStr5o3Vlu8Ct4BQk8eU8cQBcI=;
        b=cWvUZROzeZMul4X7rWzPg3EeVfm8nWy3V317itLWH/jdmUaktWHDPEc+01rTLD6S4f
         AubveEqMj8HDUMk/gsSPU8jwdBz0JQNsgS6Qq9wX/Z0ROK4HCeJOjDQ5ScwLYWNEjm04
         rG7MWJKR8B8sEQvfQTuhVH6Vc+5KH3eNETzHV0E8pLUy4NClcux8M9V4uk4hOL2tcyad
         b1IwFAO3hs21hpuzGzlcRgq/9vDYWengLKskHMlTnVSraAMVEPWVz69Pwt4JOPlGmm1c
         XHX0zCDjaJwpNkzWjCYMo8EIqlZAe1kKBgocj3ChZBIXRmSQDZp8cviVeG0uJjG2k05R
         U1fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773071112; x=1773675912; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bKp7UfWwsR+Qtr2/5qSzMlZ35ZQUtFxqOaPiGk/f9/o=;
        b=xI5mH1OkbEx5rEciwSIW1r8sSiLBgdGlSOlZdRK6ui/M4nAvFHW8cqdINYfAXsV8uG
         nI8bSnfXg0WmJyzGTT4KYmmik5uOhjiWXFNNN14RCQ6kfG8md8JpD12d9PnsFp8CBb1s
         M8dPVYwMPiKqykvvLzCaRCNuF6x88XCJz0UtP/nxZjLTELP5LxX3WZ9mmh4rvorqeHDC
         FyXPy7Jpc0aPA/cTi1HrTrP/p+3xCtoe/TNwAtZwTewTH8loPRekj2HfeUsE0o5Y8BdT
         E9EMgjx38u6ekuFmEvOkfZ9NWw8lFW9GeB+xS0zv/EBLsB1y0gkdSa1SZtV4LgVKrjRb
         EGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773071112; x=1773675912;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKp7UfWwsR+Qtr2/5qSzMlZ35ZQUtFxqOaPiGk/f9/o=;
        b=HLuc76k8KKDzDCKHvEXa5RNA6zgrIq3/sSBnOr85CIEq9hMgDtOLBYM/E6FMoHImpt
         uzV8dwotkV0td0YqTUX1Zr3j1JFQzwzIhyyw9FSn5avCZe3K0XyarYYYuhL7P3IqrC6Y
         p2+dUjMhEIoVLhuRTXPjojLrqhgvY8V1Yyr+mQiReyXumvEahwoQf0ekkWpOi00nVcai
         lNvkEvr3dqZvRiOKt6qlNVTbl6Xju8aeDBl5LP9YKR86LlwgvhFCBE/tthRY84TUIMgO
         rgk4bup9QpwQ7vgjSnkIWOgDLR5JN1rxElp/gk8OMog8X+BygvLdIYHv4WZwseSPesqx
         X4vg==
X-Forwarded-Encrypted: i=1; AJvYcCV7IA+5YXlPve0RLm6EidnEgW3ck0u7/kQzIp9BSaKcxJmqCIwcvYNwrngOteRJJ1WQpjjYdkFHX40=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2QQgw3NP2gzZYCJsfGJ9dJC80wlwF6XMtvlYvScDc1y2mvIqr
	w6viiwHeZRTjoVz1RusmVeGFnamaC6DbLSagDVS0Nx8W7IvVCczlC2+VlkrwCWRTT7j4alAM514
	eXGF+jtMDAS0dV9aCgxb+NKeQCQgC7ljb7kPD9Su4
X-Gm-Gg: ATEYQzx9ukIqglCVJ1+p5U+mrnEL1U085PRYMgowk8j8En9vp9uc9U/SGe8NmCuA49s
	DJ9evBRw7u0sLRFR0ORKbdAmCq16hhTxl32B8OGXpXqQkESoBqOad59L0qy9bWWdfAZ1Anf9zIO
	jXaSaRqU4puDxWxK+mST4pDMoMWfihCMzGU3QIzERE2MvNK8Mw6t52MjJ5bv7Ry8fJ+bj9yGl1z
	6pY+LXwUR5IDM6dvezZ+ai2Ax/DkkHmMVhQfp8ct/Pvs2t9QDVjROj/CYDjOLE5w7aA9mfP6sGV
	sN85IKhm0n8xJLe9DJUUdjDbQOV9gHPCZs1TX2FsBA==
X-Received: by 2002:a05:6102:ccf:b0:600:131f:b68a with SMTP id
 ada2fe7eead31-600131fe1bemr2252059137.23.1773071109964; Mon, 09 Mar 2026
 08:45:09 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 08:45:09 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 08:45:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <577c4725-7eda-4693-a55a-413572541161@kernel.org>
References: <20260309-gmem-st-blocks-v3-0-815f03d9653e@google.com>
 <20260309-gmem-st-blocks-v3-1-815f03d9653e@google.com> <577c4725-7eda-4693-a55a-413572541161@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 9 Mar 2026 08:45:09 -0700
X-Gm-Features: AaiRm50NI2W_b1s4wqVK3z2E19_F4wrYli0WrzITukeFFAKkCo-7bYk8Lb2_YMI
Message-ID: <CAEvNRgHhFoyh__shK_YefhUOTP4RaG-sivUH=4Gj-2iy1HX+tw@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/4] KVM: guest_memfd: Track amount of memory
 allocated on inode
To: "David Hildenbrand (Arm)" <david@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	seanjc@google.com, rientjes@google.com, rick.p.edgecombe@intel.com, 
	yan.y.zhao@intel.com, fvdl@google.com, jthoughton@google.com, 
	vannapurve@google.com, shivankg@amd.com, michael.roth@amd.com, 
	pratyush@kernel.org, pasha.tatashin@soleen.com, kalyazin@amazon.com, 
	tabba@google.com, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 3/9/26 10:53, Ackerley Tng wrote:
>> The guest memfd currently does not update the inode's i_blocks and i_bytes
>> count when memory is allocated or freed. Hence, st_blocks returned from
>> fstat() is always 0.
>>
>> Introduce byte accounting for guest memfd inodes.  When a new folio is
>> added to the filemap, add the folio's size.  Use the .invalidate_folio()
>> callback to subtract the folio's size from inode fields when folios are
>> truncated and removed from the filemap.
>>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  virt/kvm/guest_memfd.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 462c5c5cb602a..77219551056a7 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -136,6 +136,9 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>>  					 mapping_gfp_mask(inode->i_mapping), policy);
>>  	mpol_cond_put(policy);
>>
>> +	if (!IS_ERR(folio))
>> +		inode_add_bytes(inode, folio_size(folio));
>> +
>
> Can't we have two concurrent calls to __filemap_get_folio_mpol(), and we
> don't really know whether our call allocated the folio or simply found
> one (the other caller allocated) in the pagecache?
>

Ah that is true. Two threads can get past filemap_lock_folio(), then get
to __filemap_get_folio_mpol(), and then thread 1 will return from
__filemap_get_folio_mpol() with an allocated folio while thread 2
returns with the folio allocated by thread 1. Both threads would end up
incrementing the number of bytes in the inode.

Sean, Vlastimil, is this a good argument for open coding, like in RFC v2
[1]? So that guest_memfd can do inode_add_bytes() specifically when the
folio is added to the filemap.

An alternative I can think of is to add a callback that is called from
within __filemap_add_folio(). Would that be preferred?

[1] https://lore.kernel.org/all/20260225-gmem-st-blocks-v2-2-87d7098119a9@google.com/

> --
> Cheers,
>
> David
