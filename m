Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24057314B83
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761583040; cv=none; b=m1dKQTwlUNjcd/4LaQP51szE6XRF7e4Wpq24pHdK0TuJafPqg0UkjGav3cLoAy3DUdYXGwRe1dFATwLrv6jbJlNTUkl79cKeX5NYd+5ztko9rEOmv2IOkz7lSvAzFTelJS2Dz2G5Q3Twl2Jg8VdEMRG/j2/lOR5kKOal2PD05v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761583040; c=relaxed/simple;
	bh=Oi6PnYKu8At7mn2r8bJbw6fE2P/LefHPpppgZI9YhB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsV+v7SExjVuczVTCKfa+r7GRU8331oJpp2rSwTsx9pJrp/nyhAFI0HszyYq8CyIbccMcTvB5/VHz0FabbVZFl+zYGYJSu8jNIC/xwiv4kEnPvHGZGbRhWBATXpF7cEtojKfBDfbWr40LgNGcCSQ+zVO++Jv0l26yyFpibvlLTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dv8t+j1D; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dv8t+j1D"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ea12242d2eso765671cf.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761583036; x=1762187836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOy3iiebbAqjF3YwXd91msbbmKaBEHmD6+luJVRUSx4=;
        b=Dv8t+j1DH+aTBSQiYByDPRXsAZaLbYLuMTom5PppY0HeDJIoNCBNZxZbHz87wxEOkS
         hVBD0vhn9N8kLj6vB1zCswpsD6fEpbGowp2vltd+N4Z3wqu6iFEhbthX+htqm8GCzLEg
         s6ZZH6hx/6o8cSoG3AW4ta4S+d/cnzicPuKDEfuqokeKZGi5AO5JhzCI0IxDDm8IRnKV
         3a6QihF7ILWkV/KMSFbySpB5QnUNZ+HQrWn8ZT32pm2oBj7uCjlnBJvdw4242TwdzUQi
         zNV8c8FcwvgTYRVP7uCJVhEZ+vfbnmyW2iOYzBU3dHQ+fnrS/jkZciWT8vfWZDcyFclR
         yblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761583036; x=1762187836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOy3iiebbAqjF3YwXd91msbbmKaBEHmD6+luJVRUSx4=;
        b=JrdebCBRuWv/JnMfWhBFsv+RDpnVvl4Z6xF5ijizGPgwSMUf2R3s6890hafuL/xSyK
         v/JIkH7LGLZ4wzdq+axTEPlTS668thSiScg+5eRBikjBTq6/l2DFqtKh5Yo6n3B6bOEd
         dVew8bugbA5AKwjhhX1tHTNMKZjIqeXt+QU2Q5xi2BEHIezVmEMce4n1/6wWrpy4pslM
         jO9ugmFrY+sxYv/zVLVk0/u8RUqTW6JMIj9NXAxlN74wIEiFWjzfE8ViduqL4XehGdzb
         u0Vu44ML7VxSDtzXtvCjWBisTa7sjVLKU24jaU4sFqJRmGT33PZxc+zVvFdajqg6CHmw
         +71Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4ogJ54Gq1LQCxZ5qAGjVj28uqiPIPx3OotRuSpjyPFz7YIoYNpKxAa/71jYG72R7emxqFcN/IF58=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGFa21mcquSP9pOx9lLvmABY+X9yt+rhuDP6NG+oxTYmCkpX0E
	mdGniK1s4OH4e58m0iQo2YdOGzygv/7gPJ7wcKrQL0IsUoolMXg33qgJJFW9Dj1xu2tkxB7qSYG
	m63/i6IgMocbjyIegBiYVEaEdGBKq7w24Rsj7brxZ
X-Gm-Gg: ASbGncuvX1O1DqE5ay+uSa3Mjx2xt3fOXXCeVn1MDarK0pfBzYDl7ta9+mTOrJw30p6
	P3bBOA3LsDujT4t6x0a+zEJvybgJXrn77mMhtWsWJLRWtQbweINx2YrSz/wx8yUd+aIon46QM1Q
	42PWcj3m5OheY6GxfotFFsw/PEZIhF5UxDeJcrP2DLfc3hHX05oQWF2xYq8rxU8+JOpc0uIc52+
	haBDAeJQTqwDJCjb4WvS3q6MAesdx+mEJ87o+WWsDBaz+WVc29XIlFSMTBU27vl1RJ51RL+jFsB
	bwG5wLtNrdrslZ3yMVw9El2lOg==
X-Google-Smtp-Source: AGHT+IFaxIw83VYwbbIh7Erx5pfEMAgBcg1pYjNg+FGawbKps6jMbAo+rgY9Q7yMQi2Hw2U4lkBfkLGAUfTgx/d+46w=
X-Received: by 2002:a05:622a:5a97:b0:4b7:9b06:ca9f with SMTP id
 d75a77b69052e-4eba2194b2bmr16376531cf.2.1761583035660; Mon, 27 Oct 2025
 09:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com> <2-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <2-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Samiullah Khawaja <skhawaja@google.com>
Date: Mon, 27 Oct 2025 09:37:03 -0700
X-Gm-Features: AWmQ_bkrPoVQcTl-93AGiukk8qPqil6Um8n3WCq157c9AX6034wo8PiXupkuk_E
Message-ID: <CAAywjhSMnmAaS2vTcHDPfRxbSMSwmQuAUL-bgRNt+wEXi0SAZw@mail.gmail.com>
Subject: Re: [PATCH v7 02/15] genpt: Add Documentation/ files
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Will Deacon <will@kernel.org>, 
	Alexey Kardashevskiy <aik@amd.com>, Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, 
	James Gowans <jgowans@amazon.com>, Kevin Tian <kevin.tian@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 11:21=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> w=
rote:
>
> Add some general description and pull in the kdoc comments from the sourc=
e
> file to index most of the useful functions.
>
> Tested-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  Documentation/driver-api/generic_pt.rst | 142 ++++++++++++++++++++++++
>  Documentation/driver-api/index.rst      |   1 +
>  2 files changed, 143 insertions(+)
>  create mode 100644 Documentation/driver-api/generic_pt.rst
>
> diff --git a/Documentation/driver-api/generic_pt.rst b/Documentation/driv=
er-api/generic_pt.rst
> new file mode 100644
> index 00000000000000..210d1229aa1c1f
> --- /dev/null
> +++ b/Documentation/driver-api/generic_pt.rst
> @@ -0,0 +1,142 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Generic Radix Page Table
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. kernel-doc:: include/linux/generic_pt/common.h
> +       :doc: Generic Radix Page Table
> +
> +.. kernel-doc:: drivers/iommu/generic_pt/pt_defs.h
> +       :doc: Generic Page Table Language
> +
> +-----
> +Usage
> +-----
> +
> +Generic PT is structured as a multi-compilation system. Since each forma=
t
> +provides an API using a common set of names there can be only one format=
 active
> +within a compilation unit. This design avoids function pointers around t=
he low
> +level API.
> +
> +Instead the function pointers can end up at the higher level API (i.e.
> +map/unmap, etc.) and the per-format code can be directly inlined into th=
e
> +per-format compilation unit. For something like IOMMU each format will b=
e
> +compiled into a per-format IOMMU operations kernel module.
> +
> +For this to work the .c file for each compilation unit will include both=
 the
> +format headers and the generic code for the implementation. For instance=
 in an
> +implementation compilation unit the headers would normally be included a=
s
> +follows::
> +
> +generic_pt/fmt/iommu_amdv1.c::
> +
> +       #include <linux/generic_pt/common.h>
> +       #include "defs_amdv1.h"
> +       #include "../pt_defs.h"
> +       #include "amdv1.h"
> +       #include "../pt_common.h"
> +       #include "../pt_iter.h"
> +       #include "../iommu_pt.h"  /* The IOMMU implementation */
> +
> +iommu_pt.h includes definitions that will generate the operations functi=
ons for
> +map/unmap/etc. using the definitions provided by AMDv1. The resulting mo=
dule
> +will have exported symbols named like pt_iommu_amdv1_init().
> +
> +Refer to drivers/iommu/generic_pt/fmt/iommu_template.h for an example of=
 how the
> +IOMMU implementation uses multi-compilation to generate per-format ops s=
tructs
> +pointers.
> +
> +The format code is written so that the common names arise from #defines =
to
> +distinct format specific names. This is intended to aid debuggability by
> +avoiding symbol clashes across all the different formats.
> +
> +Exported symbols and other global names are mangled using a per-format s=
tring
> +via the NS() helper macro.
> +
> +The format uses struct pt_common as the top-level struct for the table,
> +and each format will have its own struct pt_xxx which embeds it to store
> +format-specific information.
> +
> +The implementation will further wrap struct pt_common in its own top-lev=
el
> +struct, such as struct pt_iommu_amdv1.
> +
> +----------------------------------------------
> +Format functions at the struct pt_common level
> +----------------------------------------------
> +
> +.. kernel-doc:: include/linux/generic_pt/common.h
> +       :identifiers:
> +.. kernel-doc:: drivers/iommu/generic_pt/pt_common.h
> +
> +-----------------
> +Iteration Helpers
> +-----------------
> +
> +.. kernel-doc:: drivers/iommu/generic_pt/pt_iter.h
> +
> +----------------
> +Writing a Format
> +----------------
> +
> +It is best to start from a simple format that is similar to the target. =
x86_64
> +is usually a good reference for something simple, and AMDv1 is something=
 fairly
> +complete.
> +
> +The required inline functions need to be implemented in the format heade=
r.
> +These should all follow the standard pattern of::
> +
> + static inline pt_oaddr_t amdv1pt_entry_oa(const struct pt_state *pts)
> + {
> +       [..]
> + }
> + #define pt_entry_oa amdv1pt_entry_oa
> +
> +where a uniquely named per-format inline function provides the implement=
ation
> +and a define maps it to the generic name. This is intended to make debug=
 symbols
> +work better. inline functions should always be used as the prototypes in
> +pt_common.h will cause the compiler to validate the function signature t=
o
> +prevent errors.
> +
> +Review pt_fmt_defaults.h to understand some of the optional inlines.
> +
> +Once the format compiles then it should be run through the generic page =
table
> +kunit test in kunit_generic_pt.h using kunit. For example::
> +
> +   $ tools/testing/kunit/kunit.py run --build_dir build_kunit_x86_64 --a=
rch x86_64 --kunitconfig ./drivers/iommu/generic_pt/.kunitconfig amdv1_fmt_=
test.*
> +   [...]
> +   [11:15:08] Testing complete. Ran 9 tests: passed: 9
> +   [11:15:09] Elapsed time: 3.137s total, 0.001s configuring, 2.368s bui=
lding, 0.311s running
> +
> +The generic tests are intended to prove out the format functions and giv=
e
> +clearer failures to speed up finding the problems. Once those pass then =
the
> +entire kunit suite should be run.
> +
> +---------------------------
> +IOMMU Invalidation Features
> +---------------------------
> +
> +Invalidation is how the page table algorithms synchronize with a HW cach=
e of the
> +page table memory, typically called the TLB (or IOTLB for IOMMU cases).
> +
> +The TLB can store present PTEs, non-present PTEs and table pointers, dep=
ending
> +on its design. Every HW has its own approach on how to describe what has=
 changed
> +to have changed items removed from the TLB.
> +
> +PT_FEAT_FLUSH_RANGE
> +-------------------
> +
> +PT_FEAT_FLUSH_RANGE is the easiest scheme to understand. It tries to gen=
erate a
> +single range invalidation for each operation, over-invalidating if there=
 are
> +gaps of VA that don't need invalidation. This trades off impacted VA for=
 number
> +of invalidation operations. It does not keep track of what is being inva=
lidated;
> +however, if pages have to be freed then page table pointers have to be c=
leaned
> +from the walk cache. The range can start/end at any page boundary.
> +
> +PT_FEAT_FLUSH_RANGE_NO_GAPS
> +---------------------------
> +
> +PT_FEAT_FLUSH_RANGE_NO_GAPS is similar to PT_FEAT_FLUSH_RANGE; however, =
it tries
> +to minimize the amount of impacted VA by issuing extra flush operations.=
 This is
> +useful if the cost of processing VA is very high, for instance because a
> +hypervisor is processing the page table with a shadowing algorithm.
> diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-ap=
i/index.rst
> index 3e2a270bd82826..baff96b5cf0ba4 100644
> --- a/Documentation/driver-api/index.rst
> +++ b/Documentation/driver-api/index.rst
> @@ -93,6 +93,7 @@ Subsystem-specific APIs
>     frame-buffer
>     aperture
>     generic-counter
> +   generic_pt
>     gpio/index
>     hsi
>     hte/index
> --
> 2.43.0
>
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
