Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529E4390CAC
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733869; cv=pass; b=nqjj29wWET8w8wRotwa/SeKqb8wwEqhiEWeX+0nMrYTNs0xqq4/5e+133HNU6MkYDZ9cqlyuk5EBQBNezoyc9SftheJzuO4bnKXiAeiWs3tayjkbjKHdmLYzupbkz5OkUd/HFpl2qSiUF14ZSfYvFUhF6XqP5Ske1sN7N2G6s4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733869; c=relaxed/simple;
	bh=FmqQi9tHDOGtMRA8eYccGrCqdDwhdIqG1ghsXPY1Uts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VvmW0F5v6QKEUSpLTP98dDZpFDEqyKqOxup/EG2MNlZOYRnod2Vu5Dg+B6tKqAFsG0SPS66Wwy913Q7yemJsE5RHJQwh5MtA8Y9hsJJlYKi8SN0HNOKM+3yt7Dvjonoz1WgHqFCQSs6e8CpOrAWWOPI2msXIemcDv2S3uSO+2fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=id3l4Dsm; arc=pass smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="id3l4Dsm"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e50a650a0so764750085a.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 08:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784733856; cv=none;
        d=google.com; s=arc-20260327;
        b=Ly+yFZsPjZ9pgj7e/cDXUf6UAhoAhGZ+Gwh09zi2qKMvxR8mDkKI6YVRjLfZBny7YV
         e3E5UpC3cXQsnns0NMxvgfzPOlImJVJNesu1LZF9AeNXrpymEOcebwAKua5lZxBPvK0U
         9LoFXnO2GnrDsZcEVw9hJmP6iiF/dqpBz+WnBemDhP+8VsQJWyicTG+EXzzTn7yp7Lqy
         OtXO1VKrtZDu+0Fnr3pup0qL2cgqLl16rmNtjEE1ESB4T8k+jN8qsApzlXTf9Dcc77UC
         iDFdsMo0VP4wJr2u9/TI/pnGHK7/GteEAQIbcwoZ70xKaxd1IWey6mHpOtf4jOXgfolY
         k8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ff8+sJsygEDuStaVFp2hCNrsI9M5jePRaYSdvrv4X0o=;
        fh=3QGA53OPNhgOM5u+Ju4mWDozHkT2KMhp/5zi5aSCCsw=;
        b=lzppMPA3G3qV4ePTYhArSNsqMRQ06h7tDfoTpkr7/b6hB47awPXeccH/J9E3UlKOnG
         Rofz7VdUHxN55EVD41/bxm4Vs8Dh6reOQ/CHKiEGzMqMFee+FMJHNu6DQs+BpUWHEmzn
         mwnj29QhpmmWcK616xjV0YSi2IW7c6pScD/q2L7Y1BpZ7LIUFlFUHPGCVXe4jihtVWu/
         IVBVXcG8VTDKTAlHzBZWlmp48V0qb/FJgE9c8M2GioGuxh0gvYEN8U3ncO043hmzkvj1
         Ga0H5PVuJ/aE4xsKb0EHiEYfU6ZLaQnUcLEjsDk3IWmMvuM9vR68Fj29DPtLx/2fSNye
         /mVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784733856; x=1785338656; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ff8+sJsygEDuStaVFp2hCNrsI9M5jePRaYSdvrv4X0o=;
        b=id3l4DsmZgREBbR6h/yxiO8eKv7LGI8EgxPiuuBbKGEHhiFxQwAxjladnBswED/Qmw
         Ax33XN2mHBzIUzHztECMTaNs72eqwSZtXmZaaifQAOiIk1JvMm4VNBEOaCCSeomIAJO0
         bmRifZH5PIDCqagNJN3TFMKqmosgxKwkzoa5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733856; x=1785338656;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ff8+sJsygEDuStaVFp2hCNrsI9M5jePRaYSdvrv4X0o=;
        b=oB+wTA8SYvIDsZWTZCb713mLrGXNzkaoooa3y4YBoixThI/1gQzEToZLk2oId7tIMc
         Wm814/yJwxla13leSfXmWLWdOUxIqbeG5qqkUZVcwy/iZqjy40Me6R+2m2ih/P3wMUuT
         BdDoXWNY5Dn2IQJDY84OiZEWTHr8pN/orz94VxzkIXkvtotp5M7kwEKH7QZioyhBsGUi
         Fo9qWyVeoNYXiR2B10rzhkFZUh/KqB+CtQ78+BixMU6ZdfrcafhE+PkN2lVNvTKtmq+r
         ld08AnNmQ3I9AAbhLxCcojThBXej1Jl1ePejylD5T7hLXknlow/GKEaV2k+DUhT88HbM
         ZLrA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5j2RHOSQ/r9S0VYIvUgsXKRZxwa8EACoSmiaIE16GNhcJEZ4mF7RL89/cTqQTy/VTB9dlJqyp0zE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW3HoKI+pb6Yw6zdcREDa3uUGGpNgT4r2AP9AzBKfrTjojklZ1
	4HxpWewYNI7FUH3R4Gr9Ugk8PJ+Jd6gSWtHVRVuIJOtAMsQyDOBhLD/fHqdcWYiiCSHxWQKIjvS
	VY8LC0jQWpfzfAxSn/WCFyabDEhYO/uDjsqksgXjpow==
X-Gm-Gg: AR+sD11NExw7IyAP3Ui7aZGLEGC12zrGQuVo/txYiNFDjS4Lt6c0dMWFKjIEbDPMTLC
	tdrsVcnsf+cvp787ndcv9WAWt6eldncttI8e+iCsWH+JvuvWL7jwP+BBfWKdlYeN4auK39Dd2A/
	FA9HOwcYQbPjRx0dHFb42nWn7fwDHs9HARVLtAvHfaUH4PjQCwGPUD/HaHMspAc31uBoOeg7iG2
	wuxH3c1v+wm8RzNUxIvnBkgqatCM2Ek/kBQ+jSzN8E7vrpOT/7w3jqBE2pZEm8UGy0KiuK/UdoK
	pEOItV3K16X0Jgz8KA==
X-Received: by 2002:a05:620a:2844:b0:92e:9cb3:3f71 with SMTP id
 af79cd13be357-930b3ed66f6mr2281752885a.36.1784733856139; Wed, 22 Jul 2026
 08:24:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720034553.68798-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <0100019f7da174eb-4cd0f3ae-59da-4533-b469-6eee009a22bd-000000@email.amazonses.com>
In-Reply-To: <0100019f7da174eb-4cd0f3ae-59da-4533-b469-6eee009a22bd-000000@email.amazonses.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 22 Jul 2026 17:24:05 +0200
X-Gm-Features: AUfX_mxUSuw0ZWzZWiq2Rpl7efuyYxiFK3IBC4AQjtyaBV6Cq7Rj41foWBlGbSE
Message-ID: <CAJfpegvkbK4xtQsssn3yrdLn7zZRGB8MeRcauP8mbmJRCnFouw@mail.gmail.com>
Subject: Re: [PATCH V11 4/9] famfs_fuse: Create files with famfs fmaps
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

On Mon, 20 Jul 2026 at 05:46, John Groves <john@jagalactic.com> wrote:

> +/* Famfs fmap message components */
> +
> +#define FAMFS_FMAP_VERSION 1

Please don't use separate versioning for extents.  It doesn't help
with feature negotiation, so let's just use the INIT feature flags for
this purpose.

> +
> +#define FAMFS_FMAP_MAX 32768 /* Largest supported fmap message */

Not sure if it makes sense declaring this on the user API.

> +
> +enum fuse_famfs_file_type {
> +       FUSE_FAMFS_FILE_REG,
> +       FUSE_FAMFS_FILE_SUPERBLOCK,
> +       FUSE_FAMFS_FILE_LOG,
> +};

Unused, apparently.

> +
> +enum famfs_ext_type {
> +       FUSE_FAMFS_EXT_SIMPLE = 0,
> +};

An enum with a single value is not useful.

> +
> +struct fuse_famfs_simple_ext {

struct fuse_extent {

> +       uint32_t se_devindex;

uint64_t backing_id.

> +       uint32_t reserved;
> +       uint64_t se_offset;
> +       uint64_t se_len;

Please  drop the "se_" prefix.

Please add more spare space here (e.g. uint64_t space[3]).

> +};

> +
> +struct fuse_famfs_fmap_header {

struct fuse_extents_header {

> +       uint8_t file_type; /* enum fuse_famfs_file_type */

Unused

> +       uint8_t reserved;
> +       uint16_t fmap_version;

Don't use, plese.

> +       uint32_t ext_type; /* enum famfs_ext_type */

Unused.

> +       uint32_t nextents;

Okay.

> +       uint32_t fmap_size; /* Inclusive of this header */

That's the same as outh.len.

> +       uint64_t file_size;

Same as i_size

Thanks,
Miklos
