Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440934;
	b=17duYwDVLPSKS2SJkbzDIEOYDdLYuM3EQvCuEgnHuWmp750Sea5kN14zK/0jgDDWses3
	 MSiP/L14JxbYmAYVEpC4VZ2Bj8B9YMVd1kaWvsDJ5fz+oWI8NcwotKrJRP+j6LXhYkwM9
	 Mh5rVjHt4tL12JnssbSEvZI13SHQI74uidMV3gIPGqf2nP1MPcyRXSSP0z9YqSbDS3P0q
	 cvRnQGe4cS3Ih0EkAgBHZ9i1H3dcJd1BWK5eW+K5BAzrno6g8ErQaQjEYBgafFOXn/g5t
	 xwm0t/je76OkusAewinY1Mz17Rm19vWFEQuu0QlkfyjhPDkQHVoHGvqcb9B74BOkrPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=scx32ipdmzZF2WgK72vmGUFyDo9O6eDPU6M168osIuc=;
	b=goRZ/+CcobOTY+6OiRlflrKw7EVe81QcLtLvij4PWiVqdYDzWFwTMJJlIUevnIjgOHLN
	 OMF9GkQtgxgKOt7U5RRw+myv5Dd9y1Havsp7oWWw5rV9W9RuKjKTCdn7uyllOO+FxGIrE
	 kFQ4/DXNt7/L7WQtrY2eqB6PNKJfXyT0eV7QLoQgWFJjMHONUaaBJsx+00ncGca543q1d
	 xC3cGA7maP6EJwPWaKfN5MESbv8fEdZXAzP1WxXvPQbWiZEW07N7r27xQ1LoRTgep+mU3
	 GjSEN4iREr0AIvhRBKGEKdwKUN1iP14TnvAos3t7+jnhFgECO0O4u16jkByBhnhuOVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v/ILaTU/";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C81606A680
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 13:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C81606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v/ILaTU/
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so33928155e9.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 05:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440933; x=1796045733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scx32ipdmzZF2WgK72vmGUFyDo9O6eDPU6M168osIuc=;
        b=v/ILaTU/7bWg5GApb65WLg4awDJCuN4p4XNf0kXaMPqk/HUIGDI+Xbq06i9Utpmmib
         OQqr1eVnIILeeQbJEVc6ncw8bSGgj3jeChoH7Kk9A10TQi44Ww+KonrQbb+HgffZfa5x
         zFhE3RBlJLcMCY1gvOlSZpysY7c4VWE1XkPTGubFxj+AIgaXW7naxrT2vgHXIDW6ki9l
         hIOob0L9YMtximd5TaiqkDZTYXkuCXHIT/d3HUok6+HqvuFW6kipibWhKWZ+yfM/8J8J
         t5Jm4wul520REt2NLt/eRPryrwbjLY/Me7G/0vHxU5v2Lo8Si9vl/jxkpMFKhXHiltgP
         c1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440933; x=1796045733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=scx32ipdmzZF2WgK72vmGUFyDo9O6eDPU6M168osIuc=;
        b=kpANPowqSpRvM1Du/gp4zZhTvobzNvguDMpbDQajaMqd+lYDETETsufMxVxtAnZeoY
         uLkkJypBMDVNeTK+Foyf8b/32CzLcbi1An/FxGCafDX7u1yKmJNT9L72JD+qbyhFsDNP
         6mGXeyypIJaJfuzMtAxbHDav3UegiNnULS6bKEtRCMae2VShx1d9+SMmQYRvf55vR24p
         AD/sesKNJIu33l7qM+9h2MdFH3/Na1PwxtvpWMS8MEPFXTngfqj6mP2OB+KDStkZLky0
         j+xx3jfQuOG7amzG3Clk4QyN+NxO02eNFYxv0LBmhdOrdgUYeiYXriulGtx8XN3e59b4
         CnMg==
X-Forwarded-Encrypted: i=1; AL+hErHhTHywNDiJhrSoHxPfGkDsxI0YvEXHHSOMJOXchZE3kseXt4fhcEooZp4vRRKkLVwNnvHNGK9ZpG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8th5SmyFsoRB7W2pKb2PeOIntQ8oT4UfrVGljkQ2DAMLUOyLqU
	E4B0k91qV8o/PFrG7W0YMlpVOjvix2qwji0iBrdW9G99lPoGLZX6aL5j
X-Gm-Gg: AZFdTZenufL4HGqVp4L+JDrhEH4J3t01r2P+qvpryCd3IL4Z2aTOxQKqx9ONgpQKOvb
	zfa3zdZifChpmhqzYdd9MBAtvkDPF31k+rS8uJ/4LKin+4mlkG319vvNLODVltAGg/yphaNN5SF
	mXrBeNg7A0G0EDc+8dZNGcvpcqubosOe1Qa5qeiBHmn0QKmFJ2ZsfDqZO/Mwax+0TNlzlRsg8da
	KQbsR+E6LLB169TKXrBRvUKVcYBgBcND52ur/ePpUFYXwanFW1aDpygEk/TmpElqmTKxx1Pn+rl
	z7OASAY9TfaH/HqkaEGZPFu1Ahzr6XPAgzoHN9/Jd8vQZUJrBvc/DRVGahfgfb8YPVilpi9qY42
	wzk/0girN7owhBo+lRvvAca4YkQJBdeTmwxnq2lxbX0tJ3rXRqUZDWBEPBGLi4TiRQFrrqYDZU3
	SDA+41YkMw24B8vM4Q01FRpaRbYVRlfvp96SuD9NFQc7F9e7TO+8qrCqFD1AQ/UYd5CLh3+2sy9
	wwMeKvRHu91OI47wK7tDectSlDuZQjr+8rKKhdJQ99jS17scBvWGJ8bdDt8LOatkEdp0yyyxNZw
	ONZ+VyvsAXJXo0RmRB20cdGy2VgZaKNb1Z1YEjofUJWSxSU9wfl9DHk=
X-Received: by 2002:a05:600c:638e:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb887e265fmr224576995e9.3.1795440932435;
        Mon, 23 Nov 2026 05:35:32 -0800 (PST)
Received: from CachyOS ([176.88.126.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm504183485e9.11.2026.11.23.05.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:35:32 -0800 (PST)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
To: jgross@suse.com
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux@roeck-us.net,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	peterz@infradead.org,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	tony.luck@intel.com,
	ashok.raj.linux@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH] msr: replace rdmsr()/wrmsr() in comments
Date: Mon, 23 Nov 2026 16:33:38 +0300
Message-ID: <20261123133338.39023-1-asafbertizlioglu@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123080822.3426355-1-jgross@suse.com>
References: <20261123080822.3426355-1-jgross@suse.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 09:08:22AM +0100, Juergen Gross wrote:
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -67,7 +67,7 @@ enum coretemp_attr_index {
>   * @cpu_core_id: The CPU Core from which temperature values should be read
> - *		This value is passed as "id" field to rdmsr/wrmsr functions.
> + *		This value is passed as "id" field to rdmsrq/wrmsrq functions.

This sentence has been inaccurate since it was added in v3.0:
cpu_core_id is never passed to an MSR accessor. coretemp reads the
MSRs with rdmsrq_on_cpu()/rdmsrq_safe_on_cpu() on the logical CPU
(tdata->cpu), and cpu_core_id is only used for the "Core N" label,
the sysfs attribute index and sibling matching. The current driver
also does not write any MSR.

I think the sentence should be dropped rather than renamed. If you
prefer to keep this patch mechanical, I can send a separate coretemp
patch for it.

Thanks,
Asaf
