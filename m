Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354AE42124A
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786438805; cv=pass; b=nL+9FP5+/xIFO4LKvzEfgmJLu/70AWJCywTFgJuPcpfQighso4WBw62I7rK26zfIyyVuli0hSwpJScgM2fPrzmdRCpPRFNG9novXG0ehjTdohmwxQySNrPs0vTntgovlI5Yjfe7HxByEzUSKdbbNd1JdKRZV9ihC/bVGlxHibAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786438805; c=relaxed/simple;
	bh=QAVJs6W1FBqjbAOF/0emhNqG9jbCkXvsyG1EUwOkxnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aaB5+zbyqsklKGnj5ksl67Xx3pE2kHPzB7wiQ6mOAQdT86NsQifzJUhRRDmFiveZqPtRRWYRpw9UEoYeOCwx3ttFVmPGIuuLHazBlqsydrVEADFtGUSlExp87UfCtkAp2cVa4noEbBm+FQBr4UrElnsRhBWhI0vrPP38sEhXS0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=nVGqfVwW; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="nVGqfVwW"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-930f4e5eed1so25927285a.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 02:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786438802; cv=none;
        d=google.com; s=arc-20260327;
        b=hBwunXoPNPBPQYlQWAwkpoMdFgtoggZZV50mjGWtnGHNH9mRUTuVkDtOzXTzV0NhoY
         EpfA0uglE8wbsu8TR27zjMCfA4NZvHhgCkXIQH1vPHzB2BytGDioFZB3+m1ql6RjHnDW
         IoflxNShJhKr2bBCGQAQr3BwEOuVDRC1lmK/4NZ74XeARwnJQ3CCia4PetWz3rYbH2tN
         lyB5CdSWDtk81UHnAhKqGpQD+KfEUopYKRl/QtCBFPM/0zu1oae3FOFhDavlvfS2X6A8
         wDWpuKIYytR+XpS4QCOZktbdF7O5UI0XEn7ejlzZ0fj15YSRCHC2LbQWdZ8pJnyZVWGk
         gqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=03hUfqpAtMk8895qbCCQElojWBhsj8Ov0HHep5mUb5Q=;
        fh=EkJbb62LgtLK+AyxzBjDacuNv5R1imvoWCpdKuuBSAM=;
        b=iD7+le9v18P0Qb/GH4ALlCDf9q7eNrZyOXzAgu8Of3LhQp+tWrF7IF0xlDpaCLclmB
         i4Ecr6FthKL7egLvxXAVmweb2SQWC3B7sQD9frt7s+fHKBQBs4s5Q/4LtrX4xVr1+u8K
         xlbwUOWZVce3NmlXqqsUS2NeVEPG2NhpDEa9PPlPYtx/HMLIg/FJUV2iKRHzyjDtyLa2
         pOItOT6r7ozhjr82wMUUoBh2517//AGjnpUcvqn3MqwDiK1pBVAEsADnIkqHkCQTumAC
         r3ODPxCu/bEaNT9TzC/h7cpa5UusyDJF3HqnaGfTY9i4jWanMQ2SA5qHhzXavHcfJmgE
         IpNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1786438802; x=1787043602; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03hUfqpAtMk8895qbCCQElojWBhsj8Ov0HHep5mUb5Q=;
        b=nVGqfVwWjlKnDAMJZhh695o7awjKGLhip0xvSsLu4dXRYuA/MyfJugV5EIgcKGVMek
         eViV3wgYs6WFhvQoXQjmOEGfuzMB8q69VBLz1GmMjUqkH6R3kn5QKpZUsFR3zbQIzp/Y
         aCNfEHr2HvjU3d8lq3tRlSU1rp9TZCMV6DJN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438802; x=1787043602;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=03hUfqpAtMk8895qbCCQElojWBhsj8Ov0HHep5mUb5Q=;
        b=r4gsXEiQrT32+LxdpmHPvGNXrsSNgPWjqDUGdWcG1NgFQaqTn36i65z0XrH9GKQAIM
         nYCyIRx4uIpXEbETVkLpOfdHU7Iduvf6kW1Z5dypNeZxRh/3ocjq7W5bH9dXMBsPt7t0
         zRk8WHD9LslisWo6nDIyTQuDpI+9xlyiqKl2FwwJ1R5AGjALskUzhSpnJywAZhkILkJ6
         mkyUF2nGZE9ZjU3/BaSoz3TfXMaUfXxsQEtn6EZuGwag+x8E1OFqF3AHQ2g8tFS6lWBb
         hiTyZ42dSlbrZ6Yr2bs36LvSw5Tv+SYMY184i2hZ/objVv13hKg5PjARjuKW82i4Mt3f
         zTWg==
X-Forwarded-Encrypted: i=1; AHgh+RrG0YgCY1IFRcm6k8PiFphbXlYvUAPRWJcW4PBNzIipkE9/Uv0B9JjGDyWuhyEPmze1VtX8pgWde0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwuhBOb1zT062m+CLFDTGVGgA4ZAf9jbXIK9soT6etKGSe9oeO
	bPel/26DvHyDyNxLri2ZBh4yrv/3bE/E9/MguY3v8gNE5j2udhT1r/hWylG7iVUc4N+ffox43xo
	Cu+XLLUzZgpfkPaKZguXjmN5cv0DRs0+D+mGqBzHoAA==
X-Gm-Gg: AR+sD12QCG5nNr3KtRxkhb6KQ3aEc5geYzj+DT9/gMFzpwQqNEgeHqrP1h2HmiibCqD
	7fdVIzAFNtVvRCLKy21PgjJOT1SzbQXztHhPULm+m4b1RsiciwIxiXi6IPNR3C4csadQlpWpGWG
	GKJmTecbFgTa9I1vMeCH4yA1mWRfHqwcyFHZrXpGkWzAZFMSmbDrFKBrGIdST4uzEzBxU9H9G3f
	9QkrEO/98H01QkSNQcWBLw+LEnwfl1NYV1IgwOmac4DWhGcYqRGqL/8sYaoSfSAOPPEqeAtP3G9
	VGhwOFM5Brh/W0Cew5FJALzdezHHMPl0eTXaIofLbK782qKi7t4h2iYAk15JQF4wBYUCxJ2ZxM2
	JqQ7Hel8eWw==
X-Received: by 2002:a05:620a:26a9:b0:930:9774:868e with SMTP id
 af79cd13be357-936a8e70eb3mr130606285a.7.1786438801859; Tue, 11 Aug 2026
 02:00:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0100019fc572ca94-ec363dd7-3a77-484b-b4b7-f2503a0931a6-000000@email.amazonses.com>
 <20260803022828.75776-1-john@jagalactic.com> <0100019fc5739e5d-bc002300-eede-4c40-9ca8-a277b754496e-000000@email.amazonses.com>
 <20260806043712.GB3560084@frogsfrogsfrogs>
In-Reply-To: <20260806043712.GB3560084@frogsfrogsfrogs>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 11 Aug 2026 10:59:50 +0200
X-Gm-Features: AUfX_mzPBN-WtEK90PQcEbgkE1jczoRAdcaPSoPUxrlnLvA164kB5DWNAs636Zo
Message-ID: <CAJfpegtW4bFn=oNfTipCxhiExaqSXnhXeBd6Uq15FpepqCJaPQ@mail.gmail.com>
Subject: Re: [PATCH V12 02/12] famfs: Module operations, fs_context, and mount
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: John Groves <john@jagalactic.com>, John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, Jake Edge <jake@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Ira Weiny <iweiny@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Haren Myneni <haren@linux.ibm.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Gabriel Whigham <gabewhigham@gmail.com>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Aug 2026 at 06:37, Darrick J. Wong <djwong@kernel.org> wrote:

> IOWs, let's fix the remaining wobbles (if any) and just merge this
> already.  No more side quests through gigantic refactorings of fusex,
> that's too much to ask after you already redesigned and reimplemented
> the whole thing already.

Without any intention to change the direction, let me just state some facts:

 - it was never suggested that famfs depend on the fusex work in any way

 - the plan to add famfs mappings to fuse was laid out two and a half
years ago in reply to the very first rfc posting and has basically
remained unchanged since then:

https://lore.kernel.org/all/CAJfpegv8XzFvty_x00UehUQxw9ai8BytvGNXE8SL03zfsTN6ag@mail.gmail.com/

I understand how that seemingly simple API addition was overwhelming
for John, and I should have been more proactive in helping with the
implementation.  That's entirely my fault.

On the other hand John could have been more trusting that the plan will work.

But that's behind us now, let's move on...

Thanks,
Miklos
