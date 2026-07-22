Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4873546D0
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 13:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728762; cv=pass; b=sRfIrI7yWmvcA8Gu7Ce2rqh22buBYRQDJR3yrgxqUdRfYceNBEHrcnrwqnz1KL0cmcPneCokXsBrr/iWEFMUp6RFyYh2rFm+t1WU1PgQwPbkV+b0YmSIowmsdjWIkHE2mbehz5pq9GyhHLbZae3Oa1bf6Rtw9I+qq5Ttvc29xPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728762; c=relaxed/simple;
	bh=l8OyTHPsSiXlV3Gjth/iDTYvVrHiTPTknws/b6slKyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnRl9kcNORpZn+chhP48/vwP29Onqs9j6dvXard9Lvn83XYe6IKbzm0c9UvadW6F4mmNJlVaKZwjSwGz1X6NqdC5Vi12KdqToJAgkhy7LKh0lOZBSXt2QXW2wQr9omzL0k4S3beM1NXil2PKGlbJdg6JXI317ceuBvJBCLA0o5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=IRDA8cgu; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="IRDA8cgu"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51bfbe05683so115154111cf.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 06:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784728758; cv=none;
        d=google.com; s=arc-20260327;
        b=Yz1mGtaup3PhrCS55fLHdMbB63Pz8gTNUE4EXTsJIPeNPVQngv3o0o6N0W3GtbTfnS
         6f4FSYbPZ8ZxuO2jmijXkAzO7mnBGbSfa7rp21+vUfJKw5Osf7wTOYeK0gI5GmMfckSl
         oJt4g4Wcb5FDrILZPBZ5pJh7/Z7Nb3OF2+hWh7WZUXIAiVaewpf6RNIKOjG++10Xzqlw
         vDS0f0P0ukIJPugGeDtqJwyuV3yTGwTyOplaqdbJ5/AqZQ2WFgAj/u91wqJ4F6VXYw/m
         U4PtZwf6zGHRKrbHBKk4hmTeKDSi9g60WfcPlDzmHFTKoYPGz3xQtjNbUkHO3i0VHOlL
         gYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vQ2/EjZAmPdGp5icD1VFPQXMQudnf/IhCWBft3t6T2U=;
        fh=dFkVKVa+ezuR2I2wI/IyB96CFq1oWNyaeWO6vVwIy68=;
        b=TBt3dPnrDao4ZA26P5yE9LV4XoYx72BRFfFEtyR9W1GpHTeCgU15Rh0q92T+Zlm7Wy
         PDfKuPnXieR4sc5Vp4tfqO4onCJJ41r8r/fd/H0yLVvHtT2vseATkWYoRU88hk+onXHn
         e67cqjJOIvLOliau1XshA1nacxMDvryBY90GozvAbVQ5h7yp7n7cAGciECYXTd0uMkwp
         AJtXT+n3gPtpvzl0dyd6P92qRR2y7lEveX4+I/lUn9rkrfpzAbozy/CMgRVRfH8e1UWX
         hMuniVvTG+o6UkCWVIqn0FnV2noEIr4pKvp+LtJzMMnOAgCsStHjQESqutDn7Gdegh9e
         FQnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784728758; x=1785333558; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQ2/EjZAmPdGp5icD1VFPQXMQudnf/IhCWBft3t6T2U=;
        b=IRDA8cguHMO2QzhU7NBs3YGsQgtYSQxWG7i9N1JAl1eUNlB9Q4IO2o01XqKibODgRO
         py+0DFOuMegMt9DXMmoo4OT+xXhqdAQDdx/0+U5Zav71E4OC3VRpjAoQmE4+UR15wZ/2
         BzkE0lhRBahs2Rpn/+gnSpzjCNXuQjaFihV1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728758; x=1785333558;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vQ2/EjZAmPdGp5icD1VFPQXMQudnf/IhCWBft3t6T2U=;
        b=aSf7kI2LNr+ds1OTNUajziV585EjZhqxG7soZpWocD0o2rcVWdBOHVthweLLs+TLbG
         2UkUtuPyK8luU8W4G98BNwDFrYuIX33qYwBoa81yUyLgG0N+b8t8N8nUJpDFAbIiqXxF
         p+1PVKT1fxiXO9cIiKR2FoQGR6TZSZH7icpRrDffqNupgpJT5YfR9WgzItYGqjcOykU0
         tetA9h/+wzt2OhFlKN2AyYFFI+GQxTT2sFhyuCoitBgps897Mi/QxGcYheGBJh3A6uhr
         Pf+QFJhptzpVXPnwF0LoN7vLnUTmPyURJLQGwZJsU//KrCDxB19qaqGxtkSnZcrNnTrN
         XQgw==
X-Forwarded-Encrypted: i=1; AHgh+RrhF+IP/6ACnxkniX6y4SQeDecmq0+F40GGew9jQfe608n6H0OPazDRSGMYcwovydjI1h1I2eDUbgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXNSukOUHP5kVEWZozPti9NPS+9AesWtJFpcQTGIhXlmQaNL0k
	GG+2zE8sXHezELmrbDb6SNXzN0I2s6i6jew2+c8oz3/mUwIdsajurJTyKqnfpUB3GB1Bj9B1vDs
	PH/w470D/ezvxXhaqWVgsJi6XJ6RaoyR3Sgj5Bqc0yQ==
X-Gm-Gg: AR+sD105q5lQg9EkS9DPsJcyBiU0jHRxWSogVwQ9f9oK1bt07eDkOU5jC8et9wn4j9N
	sRdsF7fehHPdWl4sDUYyXIigpx6+6i/7ztGeqcLiFkPEgd4yAQf6F/mLRbENwpGE6i/ESkbw50Q
	UZAz2ddnpo5zKxMmqdd0seaWJBbZnSwLqMlZ8LMVz0L/KGzrmC0zgwPAXEUf4IxE8MW00ZoYevQ
	c1OCQHHDwUXgqwsWgQ/o2oQKkSjtmShT0T59nRK9TwGp3YuHUUNkEtnh+8neAVv2HIjRBetskX4
	yjmrdxAUvaKFRNP3mA==
X-Received: by 2002:ac8:5893:0:b0:51c:7b13:62f8 with SMTP id
 d75a77b69052e-5213eb800b4mr216533471cf.78.1784728758165; Wed, 22 Jul 2026
 06:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720034541.68781-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <0100019f7da14ceb-fbd4edd7-ce17-4770-8c58-1296ad3e3fbe-000000@email.amazonses.com>
In-Reply-To: <0100019f7da14ceb-fbd4edd7-ce17-4770-8c58-1296ad3e3fbe-000000@email.amazonses.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 22 Jul 2026 15:59:07 +0200
X-Gm-Features: AUfX_mySW2J0tjX47cdgUqD8gQ_vf8pqX8_96NOWv8ZzqlVpdTk8edwifSp98Qg
Message-ID: <CAJfpeguf3EBgBrf=mrG2Jp=oNp65DDg1fZsdEaqgBn6UNNrZRg@mail.gmail.com>
Subject: Re: [PATCH V11 3/9] famfs_fuse: Plumb the GET_FMAP message/response
To: John Groves <john@jagalactic.com>
Cc: John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Josef Bacik <josef@toxicpanda.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Chen Linxuan <chenlinxuan@uniontech.com>, James Morse <james.morse@arm.com>, 
	Fuad Tabba <tabba@google.com>, Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jul 2026 at 05:45, John Groves <john@jagalactic.com> wrote:

> +       /*
> +        * The fmap size is not known in advance. Start with a modest buffer and,
> +        * if the server reports (via the returned header's fmap_size) that the
> +        * whole fmap did not fit, reallocate exactly that size and retry once.
> +        * The server learns our buffer size from the request's
> +        * fuse_getxattr_in.size (GETXATTR-style size probe).

No need to retry.  I'll post a patch to dynamically allocate the reply
buffer (already posted as part of fusex).

> +        */
> +       for (attempt = 0; ; attempt++) {
> +               struct fuse_getxattr_in in = { .size = bufsize };
> +               struct fuse_famfs_fmap_header *fmh;

This struct isn't defined until the next patch.

Thanks,
Miklos
