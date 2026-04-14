Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACCA39023F
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176327; cv=pass; b=SIqGsx69BaB0XnpOo/DgskF142B7K4FjDjTNJdfS8qASfr0zcH9nlzO4JmjkhcENgrq7gseQ1Go/j5SGFmjQFiNw5F0oY2Zwm4R8IW3HRyzl6aVYRiDCv7tkZLF2Mbrj3pTwDaTS+YWfYEEvJy76I5lP9VMeXdMnk0BdxcqYS0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176327; c=relaxed/simple;
	bh=qR1ARNJXhgZbUhvZNjjyKFCNkW5s8L/UcZxIWeoFM80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Taqyt1cbfPIIRvooiklf3TOhgozVr2ZixlobBuveOoCebFmW4I0ioyMg34UZ7FWT4uBhQRCc58E5pKlDdRJNNaUgXBUXesf2viJKmzv5fW8VHXWxm086fuK4Q5ONzIY3fBGob56VJjUabmifnGiewD2cgJXdlU0QVodJW2FfXh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=aLYDXS56; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="aLYDXS56"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50d6b9bca48so73900261cf.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 07:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776176325; cv=none;
        d=google.com; s=arc-20240605;
        b=HQHaSE3EkAfLkIDmxROqE8Ew4bpEwolvhSNHD/Zvkhm/Caeq7Vl69fp4cGAaKd18oF
         yByyQxbcK6Z8rYthVvabNrkV7u2sQGQPdK+aHJJuUXyikgOJv6OOG3gWX7xRiitaPLip
         I0yXaDwXz17kscbC4U9PBWwCkTgsnv+mrgQPRkUG6XWjyxUGAnoBl1i/hWI8dwPGRP9Q
         bRV+dcYmgXbmf0wRO3cxF7hQ3rYNTvByFqCBlqVeDnmlZQxUsJ4HWPwH/FGw0qoUGoTa
         /H2YCNT+ESNkp1Fcxh/sHFEi6Nl6EQ+zaWLaLButMO5G9KhHOG6or7Ru5xK4RhuLVJQl
         a9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BeSg31i3cb+7JrMZOeE8E9eFnlQ6LWh5RGdI+wJ//2Q=;
        fh=eP3J+PTbCVTzvbc+f69nERLzBSiKYtq5O/jbEm1cs/U=;
        b=CUYECB5wIsvPr4YCt+enK6ekRbScDJiGvoPqlrQmKqne6xb53/G4srSXa/yv/dRLyd
         AZA96pqOSVWZXoaHgUqVTUPzw5mFeWjb8aTgdf7kfca2Lvdh0Xf+e8Md+Hg5rvptLF/j
         37ZoAHUt0FYq83r24SW2A698cFDMYt01hFaf/Z3xQU3dH7dFTInGkdWaCqDwPMrRgHZE
         4pBFlz32RqL/Tyd0cw+LNF/WNsVKIrcMPAQGHc0lWKzr5IhVedyIVhPp1zX3bBh3sjqw
         f1xNUGi/+LzJNpKm6HYtT2txHj2CI74HcoecI80CPGuLmOSaLBuCSjfEsuNT8LaYm2IU
         4WSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1776176325; x=1776781125; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BeSg31i3cb+7JrMZOeE8E9eFnlQ6LWh5RGdI+wJ//2Q=;
        b=aLYDXS56/o8us38bnHNSLqBbnL5B3SDw60KVFLMVn/2uVKQovw9c/tHGitbk1B1TRq
         3otfycQbQbx4V1lBJhjRfPkygJLtKZp21KgnlPnDvKX4AG3hanVf0Jb2efE51AtavLQs
         3O7skEOmP7d9yay0IT50KL5zSiVztehyDeaM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176325; x=1776781125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeSg31i3cb+7JrMZOeE8E9eFnlQ6LWh5RGdI+wJ//2Q=;
        b=mXUnSVpD6AIhIFp67Qjlzpo9lwE8k3KwraksXc9NbNp4kBnd5z4IJZXon+K3H7alS9
         EAQ4OHIviZh3ZzQ1q0tmdQpTtIF0LwhC4T4lqaBtuJxH+rjwPHwRNmHVsLfjskcDAFrW
         7eERbC/Y8l1m7CBb8+2/5TZWLGX9Z1XiNwN07yWNNUrby9UCGk9aeNy7hEoMLLqbg8mr
         iSN3pet/03w9taHE3f4szqhl2i93PDw9w0D6tMT3tMyZBZgbjHdnuedWCjkGCDeWLFWN
         KYDK+vlZMCqodQOBMYepOipRQFk2MuzsIlVwgDzOFCeuSXmHJZiqs1l24aWyhL6Zup4f
         8yCA==
X-Forwarded-Encrypted: i=1; AFNElJ9DbRQACPw93j2CXiX4gpmsco1/qGjvXeUXgu04zgOgTDBe0UhjiW/7E4aiYMiM36i4Zzq1Rs/exwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkGTFU4iYqt5jVHy7f21Jk2Nt4nuXXxgz7CLTzCtar/apwImqa
	AEevb8qTLK2wXShRt4P4Z+CHBFI6yYyLdUUs5Kra1Q4HQYojxFwv+rvz3AJuaQsolVQ1MLlnfbq
	K8pJ4pXJwNyF5RJ9FCPJGzNpC+w6f209Nj8PKTqAiAg==
X-Gm-Gg: AeBDietBXomFXmr01ehewSRiquZpxSd6Ib5+USx9HtAh/HAP1pm4/QoyD4E0kw7VOgl
	J79l6HuC5+hmxUzowLG/xuzrDEgXSDAK0C8tR2aoX+logfktE7FH3s3diPv6jfr8zlS0ADYkAZ/
	8Ezz3OZ4jgE7VM8y9BlCrMFWWhU63K27WsTtobdq3ZoKxty3hVy5Fxgxv/9MsOYX5EltNtyTbxT
	OuzLm6wm4UNcQ7iSIODrSxK1xErdqe0TSjO/xZC9WaLnTTRxDLqW9BPH2lm3xzHu35ZrKSgrfsi
	aY3wSwqAUrZaa0EHdANP4l1mA+mrrOoj4vI3xZ/i8i6xDQA=
X-Received: by 2002:ac8:5d89:0:b0:50d:7135:5631 with SMTP id
 d75a77b69052e-50dd5b959fcmr266547411cf.6.1776176324547; Tue, 14 Apr 2026
 07:18:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331123702.35052-1-john@jagalactic.com> <0100019d43e5f632-f5862a3e-361c-4b54-a9a6-96c242a8f17a-000000@email.amazonses.com>
 <CAJnrk1ZRTGWjNzkMxS3UkeZMmrpadJDtWKontMx2=d-smXYq=w@mail.gmail.com>
 <adkDq0m5Wt9YhJ8A@groves.net> <38744253-efa3-41c5-a491-b177a4a4c835@bsbernd.com>
 <adlBcwJjLOQDAR65@groves.net> <CAJnrk1a06zkUmXW5EFiUmgAoFauwtzsYvnotaPH0ifVtyh7iDQ@mail.gmail.com>
 <CAJfpegvVTcV89=q3L326aGQjhduBcv7PVg5QKftGLjNZmCLmaw@mail.gmail.com> <ad4_jFsR951c2Mtn@groves.net>
In-Reply-To: <ad4_jFsR951c2Mtn@groves.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 14 Apr 2026 16:18:33 +0200
X-Gm-Features: AQROBzCjv32eXkH-VR3uBgnPuhuKjz5ZLSL9EY66Hi1IQzByLu6JpgnFl7pVZ3s
Message-ID: <CAJfpegsCoMMg-Ux3CbBh0d1uqDNg3Fu_8YE-LubwrQ6A-2Cggw@mail.gmail.com>
Subject: Re: [PATCH V10 00/10] famfs: port into fuse
To: John Groves <John@groves.net>
Cc: Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	John Groves <john@jagalactic.com>, Dan Williams <dan.j.williams@intel.com>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, djbw@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Apr 2026 at 15:41, John Groves <John@groves.net> wrote:

> My short response: Noooooooooo!!!!!!

:) Seems like this is a highly emotional topic...  I suggest that we
go ahead with bpf experiments, then discuss results and path forward
at LSM.

Thanks,
Miklos
