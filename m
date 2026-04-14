Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354ED2C029D
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 22:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776205243; cv=none; b=ZZeg69f1+PWcEsvQH1SwKo9d2qI6UqfpD9CUwFfsaMV839W6kTDsdy2Lx2lCPlL+pEyQ8e+f7uTQLi9d658RvUYstbVgZihfNVWC0LlLkugA2n1P5866cFcFt+w4RMG/+IzAI1N+rRcA3goHMROk53ydH5HIfH0tcuSReTruG1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776205243; c=relaxed/simple;
	bh=SCz+KPN9YjbCfPPXmoZdkTDhatvU1qb3F8G3qjLE0b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEZz6rRmthPQYiK11+M1PVLamoJnQHUERdCITfQFvqnFWf7pLi37mRUNRmjDkES+lm0akvJsKz70mYxFQOkWLk79kh6hCP4SzZF2LV4mPdPmPub5L5ctS7PAUGu+RBA62ksWUtj7f+rwsxs55onvqFpce0UKDFnb1rAlbWLrTy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=EGqrpQ3I; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="EGqrpQ3I"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89fc4147f2eso74493416d6.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 15:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1776205241; x=1776810041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U1TOx94HrlN1IHqKeiPrm5D2LnSk9lF2MFk+8RNa9pA=;
        b=EGqrpQ3Iq/bQlnINvNPLQXUv8HoMm2xy8PmxQBAbDHIHpQ+jFZRu2sW0UCjYdq72s1
         8Pqmb/jMmb0KqqROIII1m4zCDaUHHkoqG7i2pt1OODWYyAT1dGvWKmyqpsderW9paVTB
         77vhWUbPw23RXO5iN0VkI5AHdFRagQ/1VL0Jytrl8jITtUhEH9pM2+YluPIeB9IJn4p0
         9/82ATgBBZaW62My2KNeDzMu1sBiH1F4qFgK7p1D6H8CixQkfQvpypnck5Q1OYCCN6vC
         g9b+aso6BwEAJYvyFU4mwR6kn2HLE1CkW37dQGbKWoXp3H2DgCMNKEm7Q/0+Lo3BMpCo
         5vIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776205241; x=1776810041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1TOx94HrlN1IHqKeiPrm5D2LnSk9lF2MFk+8RNa9pA=;
        b=IiyfhuuGVvHUd8jplXsGtdywM4TAqXjoBjwUKMW3iguWvX2812bqIb/ZDbu3mj+/A5
         UD2RA5/fIBeRz6WV+BCoYwPFlkZFF8xAyGYZXHAiX3Y105SjGLcVlGQi6ORaVqQYenKu
         pollbz2sA79RllCeQqjOqcyp/bKLNhxxqQlNyPeenxhdbx8P1iCz06s2VDKeQRk+pxXY
         a75uns3TQzIFtBTE5hHD8Wnw5nBWBG6qj4mJYXWxKFZXzMwCS8fBKlOdVIjmVlHGL3Sj
         h5B7p7QSY7gLuNiIuQCUYjKWeN++QDFfD8BbHtaxXvQdoJiIFoUEN0vcyUgPL7qMwUX6
         c4eg==
X-Forwarded-Encrypted: i=1; AFNElJ8YyOm33r2g291xh/58utMH8r0qterlfKhyKDbj/qnXkmozPVKEIb/N0f0O4rjK2g6eIgZxLKf//l8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLi62cfNPMG4ktKsju/nl28JpwyrIgxJxdiLrORe5BITAijaag
	8s0szyk3p1baKDF1Gxz69M7nyVCrkgJ0VbHAavQU01t2fA9tZ+/+KcwDujq91ZipFKo=
X-Gm-Gg: AeBDies3hnJ6VGEWsyoq+WyMWgnKXkpFLZOd/wee6nsaMqTRfzPvSSaGt6Lks7qM/3o
	yHHRLNA+Gifm60TvQTFdNCWevSiE5zDveMr4c/5ddxaQjhW2sq7Q7G4jLYlHRIn5ZZ8HPf9X0Eg
	6EcQUWrJG7qRwYe/GfF3DtfZtPLskra6BfOK2m9m+7ufb6oZrMep9LXTCNMz1rzgUHKucw3g8FT
	6Ynp/OO3CvIX5TQpSEndWGLY+MjVwQpVoAo9HeRFuQ8W9tL3BwUTWfMSD12sb2WNajxa7jcA4Bq
	fo4nkOGkTSZLbtNOxgieDKkoMdYy81hPh4n5b3DnpoqUjEZIhsHTe1V6UnogKP87WWVTeIghVJx
	j3Cm/vNFJQUMRkbDRTx5FS/Mq9vh5Xofmr4v4jdQoHVvoDc77gmgx5EBraFah7I9teS4MV3DbhF
	ndwnEusDsazCj64wO2muQ49Z30fnoWdv0COypp8K63Hr86d+WxQWVXcnigtZjSE9fab9lU6eblu
	OWQnPDlGw0Vu6reGuG9zXQ=
X-Received: by 2002:a05:6214:260f:b0:89a:14ce:4e35 with SMTP id 6a1803df08f44-8ac861e5945mr307212416d6.21.1776205241141;
        Tue, 14 Apr 2026 15:20:41 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-243-150.washdc.fios.verizon.net. [71.191.243.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb0474sm132683506d6.40.2026.04.14.15.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 15:20:40 -0700 (PDT)
Date: Tue, 14 Apr 2026 18:20:37 -0400
From: Gregory Price <gourry@gourry.net>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: John Groves <John@groves.net>, Miklos Szeredi <miklos@szeredi.hu>,
	Joanne Koong <joannelkoong@gmail.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	John Groves <john@jagalactic.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Alison Schofield <alison.schofield@intel.com>,
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stefan Hajnoczi <shajnocz@redhat.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shivank Garg <shivankg@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Aravind Ramesh <arramesh@micron.com>,
	Ajay Joshi <ajayjoshi@micron.com>,
	"venkataravis@micron.com" <venkataravis@micron.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	djbw@kernel.org
Subject: Re: [PATCH V10 00/10] famfs: port into fuse
Message-ID: <ad69tTnx5YkD4Y9K@gourry-fedora-PF4VCD3F>
References: <20260331123702.35052-1-john@jagalactic.com>
 <0100019d43e5f632-f5862a3e-361c-4b54-a9a6-96c242a8f17a-000000@email.amazonses.com>
 <CAJnrk1ZRTGWjNzkMxS3UkeZMmrpadJDtWKontMx2=d-smXYq=w@mail.gmail.com>
 <adkDq0m5Wt9YhJ8A@groves.net>
 <38744253-efa3-41c5-a491-b177a4a4c835@bsbernd.com>
 <adlBcwJjLOQDAR65@groves.net>
 <CAJnrk1a06zkUmXW5EFiUmgAoFauwtzsYvnotaPH0ifVtyh7iDQ@mail.gmail.com>
 <CAJfpegvVTcV89=q3L326aGQjhduBcv7PVg5QKftGLjNZmCLmaw@mail.gmail.com>
 <ad4_jFsR951c2Mtn@groves.net>
 <20260414185740.GA604658@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414185740.GA604658@frogsfrogsfrogs>

On Tue, Apr 14, 2026 at 11:57:40AM -0700, Darrick J. Wong wrote:
> > 
> > I very strongly object to making this a prerequisite to merging. This
> > is an untested idea that will certainly delay us by at least a couple
> > of merge windows when products are shipping now, and the existing approach
> > has been in circulation for a long time. It is TOO LATE!!!!!!
> 
...
> 
> That said, you're clearly pissed at the goalposts changing yet again,
> and that's really not fair that we collectively keep moving them.
> 

This seems a bit more than moving a goalpost.

We're now gating working software, for real working hardware, on a novel,
unproven BPF ops structure that controls page table mappings on page table
faults which would be used by exactly 1 user : FAMFS.

And that singular user is harmed because it turns an O(1) offset
calculation into a pointer chase - on the hottest path (every fault).

John is right to push back here.

---

That said - I'm looking at fs/fuse/famfs.c and I'm asking myself what in
here is actually famfs-specific.  If you just s/FAMFS/DAX/g - the file
just reads like a simple DAX-iomap backend with optional striping.

Would it be reasonable to refactor the dax layer (and users) to
create an ops structure that becomes the basis for the BPF solution?

We don't even know what the whole BPF scope is, and it seems wholly
unfair to John's and his users to make that solely their problem (for
negative value!).

~Gregory
