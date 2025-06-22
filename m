Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A14B1A7AF7
	for <linux-doc@vger.kernel.org>; Sun, 22 Jun 2025 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750614016; cv=none; b=PrDhjzyu6q1nEMxnq1tovk+zsf/1B2QAn0d4bFrwSYjQ2SQ4z5C6ZDOCTjAc4pwMqRxDu2t8/SYXCbMW3BOHVf593EddmlkT7ISZh/RB+IPBG0dinE4UNbrlYptfZxDOxKjI9jbYiSr5PE/jF7AXqYelajVJDLXr9mE948bsRfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750614016; c=relaxed/simple;
	bh=JBS6katIuy9abXAwM/EgfQ0vNXuWJoKtGDCgsMvppwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y29TKvgOW9pgvJnQsG/rgwOQBwPr6OcEapfAU6YUw3Udmh7F1fMhuytEn45o2VLcm9coNrVJ/NQvtTjQ/H/3OxlrQ2L0TSb5OSmS2VrvRnzFzMYVPbzCVVnzzPtoe0MImW5iygXM9ZBLtcnKnjaQgi1FI0xyyeUh5uCIzo1Hsng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=qkUd7OyY; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="qkUd7OyY"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a58d95ea53so37850731cf.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Jun 2025 10:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1750614013; x=1751218813; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JBS6katIuy9abXAwM/EgfQ0vNXuWJoKtGDCgsMvppwk=;
        b=qkUd7OyYEjZA3lCPXBJ2EiCNjnegCHE58l9b9rp5DFzG3W534etSXmVuSkC8fyOX4c
         2yXHCPoFE9XUeoh2ixdyCTqX7bI9GOse/fsmLV6qJoRGE96GFREHnOSrl+e4eNkhdO/e
         czNg7xL88rWOvVdDmnkcZTQZYyKdCzp/YSWikP66SQS0kZ9xReRjfOGgQZo1rgXHZX4D
         mJ/syG00Vo7x1P8mvuc3go99/o9iGFJ5Vu0DgzaT6F+YbQX9l79sDDxhucVD+ydqscaa
         GNPKD6NQHuoo2Q2R9qwfIH+XxEBc29Snrqnx5KKh3LB9JOBRq/BFyRUoKcQxK5o37gs2
         v3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750614013; x=1751218813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBS6katIuy9abXAwM/EgfQ0vNXuWJoKtGDCgsMvppwk=;
        b=kh01SbNpTnXGntr/8d/tK4Mqw103kq5hF4KCVgcD64CliBxsZ929pUmXY4Lqd/5Fj4
         oEITH2PD9mLAb8Ooqbc9RuXzaCVi8cjUP8nuiHVoElVODRyCa/lL2LKCcexjK39vEiZB
         ejjUBcEetS6JriYLLcOHt55NMd1hlUIXj0RiDTmjBXDSSbILmaBOQZRsEYbwqHZoT+uN
         R+bl+uKT2YLIRM23OHHfSr+j05e3mxyig6CigtnEYuiQPqRgnfYB61iB/lC/M2Oacq6u
         sh8oMk9xs0SGXZhyNCCyW/vhhkYaLPA7O8lZI5gNj/SBwvgZJEzZmezYitQ+Ip3YQPIU
         Z8Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWWmviQ1ER4SQP7KZVtmkkz2o76AJKXIgyV3PZjUvU4/gMh0CtATOSyBQYqJm7Krd29ULo15rs0CQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpqyZ2jHAz0pQ0cynsumj6DYWO+zoKD7NSEKaVWEB0akGi3jR2
	9LpYhqUiYqkeObUE3byBwvgOMXCfw9tkWWnRT5BylSOJIZ9mImAKo7pX2ePXJUtOjLrM6to+DeD
	2iObk+4qT1bJ17NUZYUajLENQPVVh09cRWR4mZWdTzw==
X-Gm-Gg: ASbGncub9iZgO7e4JcWYVpDxTbTWEugSX08dNfh0LJm4i7ridu26gZGhAe/jNqzh0wI
	nUGhnUEDu00naUTVhsfW/meFv4eV2zfDeaQIJ/CZqQxa4IaNOwQvAGSVNqoHEUZdwX9Wirj0Mac
	uQIxBV4Vp1Y5WR873M9qVYP3l12jiHLDSbfp0SWjZDLXWuNe0OBbBrojLxho1EEmBp2kc65PnQa
	V1XKBPGkDYO6QDy
X-Google-Smtp-Source: AGHT+IGAQVA4j9B6bOXEQavSPQk4pUsTIQfktiOkSDRcEtYWtj2nMKnJm6GAf6TwLLKYEA7597CW46OoVjUcTVc0rKg=
X-Received: by 2002:ac8:5707:0:b0:494:b247:4ddb with SMTP id
 d75a77b69052e-4a77c2d6173mr135279261cf.4.1750614013493; Sun, 22 Jun 2025
 10:40:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530-rss-v12-0-95d8b348de91@daynix.com> <20250530-rss-v12-1-95d8b348de91@daynix.com>
 <CACGkMEufffSj1GQMqwf598__-JgNtXRpyvsLtjSbr3angLmJXg@mail.gmail.com>
 <95cb2640-570d-4f51-8775-af5248c6bc5a@daynix.com> <CACGkMEu6fZaErFEu7_UFsykXRL7Z+CwmkcxmvJHC+eN_j0pQvg@mail.gmail.com>
 <4eaa7aaa-f677-4a31-bcc2-badcb5e2b9f6@daynix.com> <CACGkMEu3QH+VdHqQEePYz_z+_bNYswpA-KNxzz0edEOSSkJtWw@mail.gmail.com>
 <75ef190e-49fc-48aa-abf2-579ea31e4d15@daynix.com> <CACGkMEu2n-O0UtVEmcPkELcg9gpML=m5W=qYPjeEjp3ba73Eiw@mail.gmail.com>
 <760e9154-3440-464f-9b82-5a0c66f482ee@daynix.com> <CACGkMEtCr65RFB0jeprX3iQ3ke997AWF0FGH6JW_zuJOLqS5uw@mail.gmail.com>
In-Reply-To: <CACGkMEtCr65RFB0jeprX3iQ3ke997AWF0FGH6JW_zuJOLqS5uw@mail.gmail.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Sun, 22 Jun 2025 20:40:02 +0300
X-Gm-Features: AX0GCFu7f7UEMKygSwaRuFS-QXgCw4dhQ6kVLLsvANPI-_VjCLQSaQpxwUYjwO8
Message-ID: <CAOEp5OcybMttzRam+RKQHv4KA-zLnxGrL+UApc5KrAG+op9LKg@mail.gmail.com>
Subject: Re: [PATCH net-next v12 01/10] virtio_net: Add functions for hashing
To: Jason Wang <jasowang@redhat.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
	Andrew Melnychenko <andrew@daynix.com>, Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
	Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Yuri, can you help to clarify this?

I see here several questions:
1. Whether it is ok for the device not to indicate support for XXX_EX hash type?
- I think, yes (strictly speaking, it was better to test that before
submitting the patches )
2. Is it possible that the guest will enable some XXX_EX hash type if
the device does not indicate that it is supported?
- No (I think this is part of the spec)
3. What to do if we migrate between systems with different
capabilities of hash support/reporting/whatever
- IMO, at this moment such case should be excluded and only mechanism
we have for that is the compatible machine version
- in some future the change of device capabilities can be communicated
to the driver and _probably_ the driver might be able to communicate
the change of device capabilities to the OS
4. Does it make sense to have fine configuration of hash types mask
via command-line?
- IMO, no. This would require the user to have too much knowledge
about RSS internals

Please let me know if I missed something.
