Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ED2234973
	for <linux-doc@vger.kernel.org>; Sun, 23 Aug 2026 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787504243; cv=none; b=eJ5jSP/LG7ymylMW9CfdQCjMuW6DsnFmuh3K0biFOb9cC4wChvACrwtZIpOS4xujRr598t6Q15e2nnnRdWySZgqMLfg6lUro4nPAaaHIGGTSwjtYOUurjxjGqrJl+Q6zMMkp/jANfKCe2rpYJb3pRurcf0TeS1deCFx2TvlJ3g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787504243; c=relaxed/simple;
	bh=FifPijUxYmOn0khIUeWNQnDh6M3c7SYp2DOwVf6Fxy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOq4xU7vh4rkyJV2r3ELxYjStzbIwcupWG+lxgKTtmlKSJ/2vVlMGdGBIUeimbjaIg20FCHJb+ulOWIg5T3BxAn76ny7ZOnUWjZ+o+SCaOuoK118ASky+IdmxFijfRZofRy5oB5vZOLAOLELNLZAejtcHFi8S3wBO+KyPRUif40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=cA9cfIUT; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="cA9cfIUT"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92edb12cdf2so173313985a.3
        for <linux-doc@vger.kernel.org>; Sun, 23 Aug 2026 09:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787504241; x=1788109041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=syT7GQtDMHPLcTTAdV7OL+T3aNWROaJmphq5EZ8nhH0=;
        b=cA9cfIUTpxGrYFtPA13FvIn6W61JHx7mZ018cw5Q2kDv7mDQZyB3ALNaoHWv4H17C7
         lKQEyxsDQuqR0Ap/X7HxniLHaRpT3HsxkdZBF0iJWaejf+/R/ORb88CcyxV7uyq6cAvb
         As0wrN7FkdWOTEitujrB8go3e/VC+lpoOJG9qLlCDXkCGzTwEZRgD9NFE0BaweQijY7w
         R0JlcIzXaQ3iK2M0ZpG2A/sN/dLX9gqJsbE2dzLasNgCmRLd9blSedtSi5QLqFQHT1EV
         fkDN5CAwNpFAMg5xBIGp75GpcpgLhIPknx87KXKClBVzZM7R2AtJ/NbrJgchuLn5Hoaj
         eqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787504241; x=1788109041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=syT7GQtDMHPLcTTAdV7OL+T3aNWROaJmphq5EZ8nhH0=;
        b=rXp4mM50Gb2PEl69whTIJc9ROZtZkSoar7SyPzsb0rTrSlgfAQ+ymL0jWbglD3zp+9
         TI3Kl9Wz2ZQ2wXKM0e7TOtucRGk/NALDPy16oGQ2NpgTDpJkWN3BN3Oky2wixwSEbOgG
         vp0Lxxw2UtOunQaQheadQwsIuFou7T+oBx0zwkeykyijrAZkNsg38ER1dA8hMmUJOJay
         R62Tan2eKiJ8LJ5j3aJzA9NkiL2LUz0k8dOBbXvzaCbr0Pje3aJqhHTeTKayiTsf+/Dr
         fDEf1MGMYvPmdr7g4IHwSf0WSoaRyUdb44OKTEWRRaSD5WCA4Y/0oVRXKqXTJnHda2U4
         OwVA==
X-Forwarded-Encrypted: i=1; AHgh+RqHB9EZVZ/rmPdFttBFww+UihkiB5FFenaMUwUybnqQLQ2y8f2qCma95EtubRrR4cbU9xy8/EemRUE=@vger.kernel.org
X-Gm-Message-State: AFuF++mrwc8hsHFoAOv2B+FZSMyEkcbclFRAs1wnPR73ocysReVRJdQB
	jv3liLJLc/a2+nbSEvH1wa+/ZFXAawWEAXvCKGiNWHFddSYeuSSohR771AVu6ptX24k=
X-Gm-Gg: AR+sD112AE3m6J+RorlyindwporYzbgMxVSfQGczTGTFKu5wMiAX2s8SGcW0hLPnkFV
	jPXYQuFGVOg/hOY+FxL+IFWJzhk51Jbcy5erumzi7CpC4ZXWo7ZgsNHHP5vZlYC5SMv9ZmGb00P
	aBwDLyj6A0PF19cbrPzxQ0FgTXk3+XVZZXE/349ZHIST0FHdvxO4MfA5ORebTEGMVnhTydIeXk+
	+OM+PFsfp85ShZwbX9uiVGy+nvn8qbjb9GKE56pS3rrTwwAuU/qiwH5JIWD0X/xKhcAqQ+WWxCO
	Nc6i34wCvwKihbQPuJ6sm46KrD+JvRdDce3ubiwu9Hlvv5BsNl7ZxHLYKbIH4q9ah/Y8czTMC+j
	bT4GgZ7nonO0PnjDNDV7cUWK03RThig5GoEYDGgTJ9vLlwP46kRqq8z4XpXJFgOHTRk0ul9yKkw
	aRFRC18TjX7ktfAP1W23gEnqOQ/MRATjzZ2EGcgBXFJYvZEUJCK0AQXpe6OU4MHfHuqlwsDCJlM
	B3lVa7UptyGECJGnUWH9iisfCzgR45PnrTCM4IXwuAo
X-Received: by 2002:a05:620a:4142:b0:932:dbf6:6f9 with SMTP id af79cd13be357-9373942e4f9mr1755655485a.9.1787504241119;
        Sun, 23 Aug 2026 09:57:21 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749ea4cb8sm328642485a.41.2026.08.23.09.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 09:57:20 -0700 (PDT)
Date: Sun, 23 Aug 2026 12:57:17 -0400
From: Gregory Price <gourry@gourry.net>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: John Groves <john@jagalactic.com>, John Groves <John@groves.net>, 
	Miklos Szeredi <miklos@szeredi.hu>, Dan Williams <djbw@kernel.org>, 
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
	Ackerley Tng <ackerleytng@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ira Weiny <iweiny@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Haren Myneni <haren@linux.ibm.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Gabriel Whigham <gabewhigham@gmail.com>, Aravind Ramesh <arramesh@micron.com>, 
	Ajay Joshi <ajayjoshi@micron.com>, "venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Subject: Re: [PATCH v13 10/12] famfs: Add runtime operation-permission (opts)
 framework
Message-ID: <aoslrrY7CrpmUc3E@gourry-fedora-PF4VCD3F>
References: <0100019fed5850ec-2bdfb17a-3086-44ea-8fdd-777d3ce12a33-000000@email.amazonses.com>
 <20260810202539.96378-1-john@jagalactic.com>
 <0100019fed5a5210-a09f1bdb-c705-44fc-8108-a7e7995a7af0-000000@email.amazonses.com>
 <20260822000728.GB6047@frogsfrogsfrogs>
 <aokdSo9li0RtEt35@gourry-fedora-PF4VCD3F>
 <20260822174029.GC6110@frogsfrogsfrogs>
 <aosejKmNJxCIpQho@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aosejKmNJxCIpQho@gourry-fedora-PF4VCD3F>

On Sun, Aug 23, 2026 at 12:43:14PM -0400, Gregory Price wrote:
> On Sat, Aug 22, 2026 at 10:40:29AM -0700, Darrick J. Wong wrote:
> > 
> > A bigger question I just thought of is sharing cxlmem between files (aka
> > reflink).  Is that allowed?  I could see a theoretical usecase for
> > programs A and B wanting to share some cxlmem for communication or
> > heartbeats whilst having their own /a and /b files for their private
> > memory.  Probably you'd just create a /common file to do that and not
> > map the same cxlmem page into /a and /b, right?
> > 
> 
> Anyway, there's "allowed" and "useful".  You could technically do it
> (maybe not with FAMFS' current guard rails) - but it would be useless
> unless Process A and Process B were in the same coherence domain.
> 

One point of clarification - useless for both processes to write to the
same file concurrently, hence the need for a producer-consumer design as
John suggests.  And even then the software needs to handle coherence
and cacheline write ordering (which is also not guaranteed across
coherence domains by any current specification I know of).

~Gregory
