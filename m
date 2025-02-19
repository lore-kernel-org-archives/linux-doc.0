Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0CD1E0489
	for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 12:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739969339; cv=none; b=cdpWiipFDgFtaYrHVA378t6zJffEKxilmZBcVAYfvdKJ0B3pkFbpSy9qpq2cVqvDpQs+7CcpCY8iQqjcZyjeLujkdBSXvNGqE2NJZEdCOJLQ8PJsXgbZTKHBx81e7BwOOb6MSolKWL8s04dPy/wjCMA/YYs+awHbMqUlQhUih9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739969339; c=relaxed/simple;
	bh=Thdr1wpqf/QLeTUfSv5bdo7ibZ59exxf85YF/5cIyXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=np5JKk7tAeaI9JyXGA2PjhkSXsHdewkkn3dD3BiWg4dYGl0iJ4E7H0lFtkNK97GI3jUBSBH/Ij2wl8uiBpkphhHwC9thlS7ifISFviiPErjuDduh7imD4yoJ6XOGNbAHQ5p78Ep4lLvEpn10sdMwCo/sSOH+33tINyv+ntXENNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O5r+TtEz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O5r+TtEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739969336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SMHHlCMcxXYtVaRR1wTwHJJB8CwWA0AX/SUXLDYSpC4=;
	b=O5r+TtEzw9Va9IxM6FlfDZNywSr8IH/B5cy7R/xdW2gEwxudNGM64EJKCHrYBQK7g72w8M
	zrwMuYxA8cfVdZthLEvWAxboxy+ByRmbwOeMReJsKVWAJmWYlTdhARmzjBHJZoEuorP4U8
	4+/zrptkJRtIS9x9mcoJSsH+GEjl+1g=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-Dsh0aeMwNnO_dW1Jx1bHsg-1; Wed, 19 Feb 2025 07:48:55 -0500
X-MC-Unique: Dsh0aeMwNnO_dW1Jx1bHsg-1
X-Mimecast-MFC-AGG-ID: Dsh0aeMwNnO_dW1Jx1bHsg_1739969334
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d2a6ead92fso40808225ab.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 04:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739969334; x=1740574134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMHHlCMcxXYtVaRR1wTwHJJB8CwWA0AX/SUXLDYSpC4=;
        b=RRr3/f6Z6WcyhUWQbdfHYuSfzOYaAHIRk+bvUXPSXutLGlEkhmD9kKjSz17pvarWu0
         yuX83w7UfYifNWYtSQMy9RFyqYpeRGG09pMRJ5CchMYdkHLI/urB8ZtyBusEIf+KmY1F
         lnayTiSYYvX4EKOGn/Hqk8K69hsvYdA4sBax7Nn1/v5LUktkUhMYcqOjalOi6VA7160X
         cJwxOznSOArklV8xZj5Je6nRX1LXZbyTR50IXq3ONWkkyB17R4HgfAfNf6Ymqhg0d+v9
         8pjtqFoWSVU9FyYJfOc3MfICE175J1yTgmBps+DFoLBH368RdKCT/uYjbixOOxAt2PPT
         5AMw==
X-Forwarded-Encrypted: i=1; AJvYcCU7pEylAdX/J/ry91ueGWWjNgujKiqfROApcaDjXcqF+vHoAG5uqGDw3/kEdawdVeGz5UKOVar+Py0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwduzWDygzyQ8VyR2rbawPiSB6Uqy6kvZ+cf0zF18lpeXuDYeVU
	Ihjl8GJ3iRUW56G2aFmLkmx/qPl9E7O8QbvOiwDqSlWQPSmYzp0px4mvHaripkDKc5Rt3YxADQW
	CspuvCnCATzMcESM7mnsUbA8WPfYqxshhbZEwxTaOHU4eK2V4WrG+oTdfshLlIBi3l/6TErv38x
	eAhPXdTfUHYF0Nx84vbsC1pjpHGwotWN3X
X-Gm-Gg: ASbGnctOH9xem9xomd/7veQif8mRMM9y1i+Oj9bDJ8B06M8Cq9Nnyriso8lHyapMn46
	zMuLj0TFAE1/YjSi3qJGcO5SmH02DUNABs7GoM6y15mKAmnRyZm2Jvl7lzTMTw2A=
X-Received: by 2002:a05:6e02:184d:b0:3cf:bb3e:884c with SMTP id e9e14a558f8ab-3d280940c90mr162913865ab.16.1739969334508;
        Wed, 19 Feb 2025 04:48:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQzXwQKpyH3rywpGs7BzP6mbj6/B897FEVbfIit3jAtaZt2ga8Vr+6/m/vSCYkDIbGIHSmC6KPV/ULHybcxNs=
X-Received: by 2002:a05:6e02:184d:b0:3cf:bb3e:884c with SMTP id
 e9e14a558f8ab-3d280940c90mr162913745ab.16.1739969334259; Wed, 19 Feb 2025
 04:48:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org> <CALu+AoRMQyRDFS_4L0KQkmrFT_S+yk=uZ-Mqt86JQYKKnj-5Ug@mail.gmail.com>
 <Z7WJD6eBLuIRnLwk@kernel.org>
In-Reply-To: <Z7WJD6eBLuIRnLwk@kernel.org>
From: Dave Young <dyoung@redhat.com>
Date: Wed, 19 Feb 2025 20:49:07 +0800
X-Gm-Features: AWEUYZlzn2-E8ZdtRbfhtM_eLch7RFvZ-yzSIrzOWYzAtm2oUJ9ngWc6Obau8Nc
Message-ID: <CALu+AoSaEthfed1NOYPiQgm_g-dhibVMRAp0+=_+9qTT4_x=tg@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	Anthony Yznaga <anthony.yznaga@oracle.com>, Arnd Bergmann <arnd@arndb.de>, 
	Ashish Kalra <ashish.kalra@amd.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, 
	Eric Biederman <ebiederm@xmission.com>, Ingo Molnar <mingo@redhat.com>, 
	James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 at 15:32, Mike Rapoport <rppt@kernel.org> wrote:
>
> On Mon, Feb 17, 2025 at 11:19:45AM +0800, RuiRui Yang wrote:
> > On Thu, 6 Feb 2025 at 21:34, Mike Rapoport <rppt@kernel.org> wrote:
> > > == Limitations ==
> > >
> > > Currently KHO is only implemented for file based kexec. The kernel
> > > interfaces in the patch set are already in place to support user space
> > > kexec as well, but it is still not implemented it yet inside kexec tools.
> > >
> >
> > What architecture exactly does this KHO work fine?   Device Tree
> > should be ok on arm*, x86 and power*, but how about s390?
>
> KHO does not use device tree as the boot protocol, it uses FDT as a data
> structure and adds architecture specific bits to the boot structures to
> point to that data, very similar to how IMA_KEXEC works.
>
> Currently KHO is implemented on arm64 and x86, but there is no fundamental
> reason why it wouldn't work on any architecture that supports kexec.

Well,  the problem is whether there is a way to  add dtb in the early
boot path,  for X86 it is added via setup_data,  if there is no such
way I'm not sure if it is doable especially for passing some info for
early boot use.  Then the KHO will be only for limited use cases.

>
> > Thanks
> > Dae
> >
>
> --
> Sincerely yours,
> Mike.
>

