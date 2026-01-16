Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2164233704
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 17:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768584618; cv=pass; b=dWr3UYXWlPCSkDKJt7mTERifrfyklotA4p2EaEcXE1XJiKEv11gkVgwIjGu3Pe+1RJjB0CE2DcENQL5ytszbL3BtREJNMI8lsdhHmiYDeUqT3a6xPbjA6Ix8cEJi1Kd+nO/f96g26ISEw8Jiv8uj/87o2UeclXNKv9JI4MTnzcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768584618; c=relaxed/simple;
	bh=dI/o20x9Y2HfQtj2OfDVbvhM6LWHTEelpWzil3w2nKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SNEOLmFxyjApMdIzDFTCgB0wMilcy/5Ix2HwZLCDlI7XpG5mhOysbSDxaBgVRPUTYorT7ITfN3rlfccyF1z0vb44zMcM1sfuTzmX4H1fPjSHZtCnh7YlmTo2w3V11d8M9up7thSDyeBgRHP05pODLEWeDng/4a02fUd6R17gPLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cMzAj7vU; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cMzAj7vU"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12331482a4dso10056c88.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 09:30:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768584616; cv=none;
        d=google.com; s=arc-20240605;
        b=TYYPYOCbXu9ljy06dmuWpe8A+ePUEXzc0qvEwaVqQ8lT7gAe5RMviPmrK6oAAESQJ9
         oDYcNR6vgKQMyM2a2Y9UQGYLaOyNq0lgoCEphHuJyIvohXbcw93dua8F4sRP4zfKSuhr
         lNW1W6tUx5q28ZC4I9A/I8HZ9V8qT+vtLtNJP5rcEIbmo6LzfV21JYxpd9U6wqck3OuR
         3gZ5fjaL0FLvahzpu+FEgc7ubkMaiqh+2SGn7CuN1O6aDuN/zWhhRtcHPkJMO2k9qHN8
         i6C8480nv98QonAosTPgD6qfezNUGiFMVL+MsePSlcI9412HBrt/MleYtQr7ilqG0m5z
         Y+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=53uWNErBo7wI6ZcBPOrPDVWa4idMxyXiq3MzbljTtl8=;
        fh=y43ApvdEPiy19F3I6HlZJ+hy/G+3/RTonCblDMpo9Sw=;
        b=fquFzu6XleKM2ESf8o97k/8tjpm4vz1af00ntq14bsP83/MGFfmZLas7DuwfSG8MOQ
         Hw46HFEGgDjpFF55xlr9+EzxEbj/VEFYQw44tWOAKrhLduCQyepzLOf95Vr3HHC0g56L
         kMd4hm7wSwm2iDB53QSveWy57YGw+2RCHCAfR0zCjhZH9sS7vtzpbz8ExXpNzXiDvb/J
         Y4G0ngsUHOexw5L9qEPKK5Z9Jq9EfkznzIWN6rUnfmdzgKlJKq/hr3G4c2h2UO61XzDe
         2qv+Nh5P2yHxBBcQ4gwYPi7Qj9RBO3iqG6lpjpxvliOLdejeODNm/O4hd6gMD+i1SG3Q
         zPDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768584616; x=1769189416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53uWNErBo7wI6ZcBPOrPDVWa4idMxyXiq3MzbljTtl8=;
        b=cMzAj7vUABe8dPh5WNsuDqCoyQOGQh05QMTthRB+oMniParlDOd78AVhT83M/WesAC
         2p4Ja5/iUK/xKv7yvrg1SkXmftuZ8H0Pugw7SQPnZ5BVXsF/b0HxYTNm9IkYwOFckUKT
         0tgLbrfT4a+L+302jytSMsO7qxbvUZLLzBH0HmXNVtSiG3M0yPbkdXDZyowJTO/Eh6Db
         Dh1NIcfY+h6ErT2QfKaMCbZRAlNOfz9dOL8IParsu0DVHWw3Se/5Cmd0mdF+p3PT/oXu
         CQrseGXSWi4T1lo4G3iOR98LAs6WjHXLj1aKiwEsmyoPRwHsnvRBPM47suE0X6DLxxx9
         FJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768584616; x=1769189416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=53uWNErBo7wI6ZcBPOrPDVWa4idMxyXiq3MzbljTtl8=;
        b=aVj/mlxxXHi+gzsYgkLSYK9KEBKK1IrbVvn8IuI6h/pEWIPefuAsEKsB59EUd6zIkN
         j6g18fEm/pIsskOwe25vkrtoA7kf0588JfbDYUYw002qDUgvz23wbqDB7BdO2Tp1HYjw
         PZ6V3D53GEgail+ldYNEreFFY33c8f9O3HdRQz0GZ0Szri2q6xp3tdYwKazPmgJ132Pw
         N62Y68nYUHYTc0dIty3ShwuFpDtyyag4M2vNtInHRPWDplUymzNRcz46ZD6GV43CVuFq
         IKvRPEclyIjK2OY3vvClrbD82FyWRLRZjuOI1S6DOG3yFUGr5nFGJgEAo1f+sf4hijS0
         7bjw==
X-Forwarded-Encrypted: i=1; AJvYcCW6zL4+LBnhXy0I1h7FakTK5YivF6sbnRz7MHGx0cffKtuVlSZdl5pzIcgyw3L0RBu6PVbMe1ftJ1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0kA6kUf6s4BH766A5IuN/kaYOMsq6tejfyOYV+MjezSnVmfxW
	E3ObqLEZOXOvy/qZNbX5XczStCKB0P3wYJZNk3IxEMsERL7hmlgB4ml7w8vxXSOAdnESI+D6AgP
	lC6FJm1YNjIXA4L6ohrF2Z+SqdPtLBY0Y1iG2/ojy
X-Gm-Gg: AY/fxX69tASyu/a5wPnde2U8hFzy2Yd1KSQBJBUHiagMFRUQkAq2mPoerYLkdaN7PeI
	ikJkeKzeRYQ0QdRkDXuUSbLZDdqI/E1ARUOMRZmE0h1vi62ZUWPT+hnxNOXjGNk6mHhOSffaDwj
	R5NG7rGHJKgsHq09fde/XcBFrrjsrgxvbxWNLYHZ4ek7iA1Wdv1SZRTNTzej0Tn9T92ngASbgQ0
	r+wyf4E2NmLzHElP9+yP+fzRhj9VYdYufpaYkQtCt+bv5khJqM+DUPSF4n0N9G26lVjMkfIBIuz
	CRk9nIfLaLRyQl1rs7WVHG3IMjr+miohLehU6Yc=
X-Received: by 2002:a05:701b:2212:b0:120:5719:1852 with SMTP id
 a92af1059eb24-1244b44d299mr107912c88.16.1768584614413; Fri, 16 Jan 2026
 09:30:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <ed01838830679880d3eadaf6f11c539b9c72c22d.camel@intel.com>
In-Reply-To: <ed01838830679880d3eadaf6f11c539b9c72c22d.camel@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 16 Jan 2026 09:30:02 -0800
X-Gm-Features: AZwV_Qg33M1rO31dgikgfsTaot12EQbVpaEnX3TxsJMPXzhkvu_Y-NHzJrI17yU
Message-ID: <CAGtprH_qGGRvk3uT74-wWXDiQyY1N1ua+_P2i-0UMmGWovaZuw@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"kalyazin@amazon.co.uk" <kalyazin@amazon.co.uk>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "david@kernel.org" <david@kernel.org>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"svens@linux.ibm.com" <svens@linux.ibm.com>, "jgross@suse.com" <jgross@suse.com>, 
	"surenb@google.com" <surenb@google.com>, "riel@surriel.com" <riel@surriel.com>, 
	"pfalcato@suse.de" <pfalcato@suse.de>, "peterx@redhat.com" <peterx@redhat.com>, "x86@kernel.org" <x86@kernel.org>, 
	"rppt@kernel.org" <rppt@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>, "maz@kernel.org" <maz@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "ast@kernel.org" <ast@kernel.org>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "pjw@kernel.org" <pjw@kernel.org>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "willy@infradead.org" <willy@infradead.org>, 
	"hca@linux.ibm.com" <hca@linux.ibm.com>, "wyihan@google.com" <wyihan@google.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "jmattson@google.com" <jmattson@google.com>, 
	"luto@kernel.org" <luto@kernel.org>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, 
	"haoluo@google.com" <haoluo@google.com>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "coxu@redhat.com" <coxu@redhat.com>, 
	"mhocko@suse.com" <mhocko@suse.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"hpa@zytor.com" <hpa@zytor.com>, "song@kernel.org" <song@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "jthoughton@google.com" <jthoughton@google.com>, 
	"martin.lau@linux.dev" <martin.lau@linux.dev>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, 
	"Yu, Yu-cheng" <yu-cheng.yu@intel.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "eddyz87@gmail.com" <eddyz87@gmail.com>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"shuah@kernel.org" <shuah@kernel.org>, "prsampat@amd.com" <prsampat@amd.com>, 
	"kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "itazur@amazon.co.uk" <itazur@amazon.co.uk>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"jackabt@amazon.co.uk" <jackabt@amazon.co.uk>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "andrii@kernel.org" <andrii@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "derekmn@amazon.com" <derekmn@amazon.com>, 
	"xmarcalx@amazon.co.uk" <xmarcalx@amazon.co.uk>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "jackmanb@google.com" <jackmanb@google.com>, "bp@alien8.de" <bp@alien8.de>, 
	"corbet@lwn.net" <corbet@lwn.net>, "ackerleytng@google.com" <ackerleytng@google.com>, 
	"jannh@google.com" <jannh@google.com>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, 
	"kas@kernel.org" <kas@kernel.org>, "will@kernel.org" <will@kernel.org>, 
	"seanjc@google.com" <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 3:04=E2=80=AFPM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Wed, 2026-01-14 at 13:46 +0000, Kalyazin, Nikita wrote:
> > Add GUEST_MEMFD_FLAG_NO_DIRECT_MAP flag for KVM_CREATE_GUEST_MEMFD()
> > ioctl. When set, guest_memfd folios will be removed from the direct map
> > after preparation, with direct map entries only restored when the folio=
s
> > are freed.
> >
> > To ensure these folios do not end up in places where the kernel cannot
> > deal with them, set AS_NO_DIRECT_MAP on the guest_memfd's struct
> > address_space if GUEST_MEMFD_FLAG_NO_DIRECT_MAP is requested.
> >
> > Note that this flag causes removal of direct map entries for all
> > guest_memfd folios independent of whether they are "shared" or "private=
"
> > (although current guest_memfd only supports either all folios in the
> > "shared" state, or all folios in the "private" state if
> > GUEST_MEMFD_FLAG_MMAP is not set). The usecase for removing direct map
> > entries of also the shared parts of guest_memfd are a special type of
> > non-CoCo VM where, host userspace is trusted to have access to all of
> > guest memory, but where Spectre-style transient execution attacks
> > through the host kernel's direct map should still be mitigated.  In thi=
s
> > setup, KVM retains access to guest memory via userspace mappings of
> > guest_memfd, which are reflected back into KVM's memslots via
> > userspace_addr. This is needed for things like MMIO emulation on x86_64
> > to work.
>
> TDX does some clearing at the direct map mapping for pages that comes fro=
m gmem,
> using a special instruction. It also does some clflushing at the direct m=
ap
> address for these pages. So I think we need to make sure TDs don't pull f=
rom
> gmem fds with this flag.

Disabling this feature for TDX VMs for now seems ok. I assume TDX code
can establish temporary mappings to the physical memory and therefore
doesn't necessarily have to rely on direct map.

Is it safe to say that we can remove direct map for guest memory for
TDX VMs (and ideally other CC VMs as well) in future as needed?

>
> Not that there would be any expected use of the flag for TDs, but it coul=
d cause
> a crash.
