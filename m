Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815E12D4B40
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 09:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754569; cv=none; b=r79+21+74ShF6G4Sa67pIAbyPmM7LgAgkYOSZ2Yo+HphuWFSNvCOMowp22tvuIInBJNCCYeZTBWBxLjoPZmf0QtqJSCjuhvTeOqy/cFbVTNwqCiIz4IU+Da8NtS/fO9gSVar+lF9beXXuVosP9P/bryMH6JQtkCAuLxIkMfyi9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754569; c=relaxed/simple;
	bh=TfoVuq/kfOrSLR5q3Q2PvAIq43+84CdI4MDduMMki8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWfICOxFguTlNZ6ck5NCFo84vZt0MEL7QSt334/pK3zX2uC1DnxhHkA9U/ge+Bt22Bw95gTaCE4NSAOpCwOUAFTi200HPZjIzQhhJXxs9BIsn/3WxrleHbBS4p0q7fwzV3ZU1OyF2IU1XxpQOXAWKDx074bX55pq1kaTo7dsXcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=uiGLOukG; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="uiGLOukG"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ed9c19248bso54753161cf.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 01:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1764754566; x=1765359366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e4Eawf8pIECibSIF57xM1mIfch1nwnHWtQEv9hXhp9Y=;
        b=uiGLOukGXebB7QWhwWDmn+c6yxbW0hy9Q8KlrGM7QkS6F8jlJJ6jFVENLhd63+bXJn
         Cl58nFENoxcYSgFTjmPjAh/q48DUU6vLbN3ryoWmugIKaTRxj338PfHJA9WxHJ9MEshU
         Dd3WNI/NUZKYiutYYJGzvm/hfw14IUqDrk8FaKKRePVg246ydDUbaH/fdOpys6KZMZc+
         WQNyo7jRZberA5dmIy7QzNlwGHkBQAxb9ioqqSR5wWMPr/ww/3eQVEVHi4262cKbYPYV
         9FsTwYIYYwX5WT7EIO6Xjqsp2QHIxb9WZ0DPWYUcyO2a7F5LumzIBwSZg2ga8vD2JFYK
         ZkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764754566; x=1765359366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4Eawf8pIECibSIF57xM1mIfch1nwnHWtQEv9hXhp9Y=;
        b=NSBtAuIoRXeu+g4K8EQS6nspW3CB6yuYIlV2xUEmYcg6dZw4gnDjM3dEmI2Ug/brEs
         YA8A4Q2ajkLiarDZvZAX7y1iHd2NfW6HxQBPhTyCaoPisXynprAmANPu0SUkWjY1bV1n
         iL68hPFU+kEIaPM2bqzDvr4sOXelOlTohealCWgz3hym1e2oJmAQ0aUM9i2H77EeMOkK
         SyMBgzWnfpF9Aq/Yk4XAFNFiULjWu2KR/8Ol8vuhLtMcWkMq0WFUcMEgwOJKCdawU9dW
         p8qtvD2YqILOETN6vdXeE5ushETlX5O5SwHZxVX9LUHV+ntQnFiSNCzXwJ3Lrm3Z0z0A
         IgCg==
X-Forwarded-Encrypted: i=1; AJvYcCUlh3Q4hQHK2ytkt6/s2zUXt0+yMgwFp9TLaTmAdq4rn68FwQrjRUyD1hd5NnLDxrYXiOpJn+2N+iQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrUQ1Gy5JVlAhoFTJqPA6TqqfrN/f6miHfbGaMYk+4KHWWLAvZ
	VyzPA/2wxKWGUj/nBTFY/sYjlouwZlCaFEwzQ35E6Byt8m2yc2j8Vbmd3kjS0kyzmTc=
X-Gm-Gg: ASbGncuPdBivLaPnaYVqUeqNi9Odh5REkd83tDQXj7ENvNJi1Uifl0CXxVIF7GGJWwn
	A6i5OasEubjoYxlNAQbkGUO+RGxuxr9EU21cPT3H68MXRbjkTSxZYc3Pk+35oQYaLrt1PaPcKD1
	/aAkr+Y9SrnKh6OalTxl8IwV1KkNgJqKkYz9faYSxbWNJv4EF2TlkB1dGlb8JYalW7tG6mRIO4q
	V0Npuaw72iDgcDQP6wjuFQh4lfSNKzHZjUEn3EhKY/vSPYW6oBm3criq/pdCMPRsWwJZETlMW/K
	5OV9dA/Jmw2YiMA4JTzDAfpCKlbqzjopgE/dKHUgnvdO0y7748wWUSLq4o82w+IPNuyrRsXiRI+
	bnoM9ToG1Hot25be2ncxpNWfdlFHUUW/2Pbw6akmyixYXBHSxi0x+QbEKc/bh6iMpWOQPevWeAl
	CMZxsKzbbDR+R+LwxHqx9j9rhSlvdei3bHrFumqZ7OOYx63VB8NsV2fpk/ve4R44++bMP+aA==
X-Google-Smtp-Source: AGHT+IEUZ8tfTAa61Ui7bWHEU4nXj+eZu9SvD/PqHUYpG9idGkOBGBL4BIPt6dGLGrl7dJzsYkPBgA==
X-Received: by 2002:ac8:5d8a:0:b0:4ee:228d:d6b8 with SMTP id d75a77b69052e-4f017696d28mr24807741cf.70.1764754566364;
        Wed, 03 Dec 2025 01:36:06 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd3437a5fsm110792271cf.27.2025.12.03.01.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:36:04 -0800 (PST)
Date: Wed, 3 Dec 2025 04:36:02 -0500
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-mm@kvack.org, kernel-team@meta.com, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, osalvador@suse.de,
	akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	muchun.song@linux.dev, Mel Gorman <mgorman@suse.de>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	David Rientjes <rientjes@google.com>
Subject: Re: [PATCH v3] mm, hugetlb: implement movable_gigantic_pages sysctl
Message-ID: <aTAEguKBAXN1p7o7@gourry-fedora-PF4VCD3F>
References: <20251203063836.187016-1-gourry@gourry.net>
 <305328e0-3011-409c-a040-76fc478d541a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <305328e0-3011-409c-a040-76fc478d541a@kernel.org>

On Wed, Dec 03, 2025 at 10:26:20AM +0100, David Hildenbrand (Red Hat) wrote:
> On 12/3/25 07:38, Gregory Price wrote:
> > This reintroduces a concept removed by:
> > commit d6cb41cc44c6 ("mm, hugetlb: remove hugepages_treat_as_movable sysctl")
> > 
> > This sysctl provides flexibility between ZONE_MOVABLE use cases:
> > 1) onlining memory in ZONE_MOVABLE to maintain hotplug compatibility
> > 2) onlining memory in ZONE_MOVABLE to make hugepage allocate reliable
> > 
> > When ZONE_MOVABLE is used to make huge page allocation more reliable,
> > disallowing gigantic pages memory in this region is pointless.  If
> > hotplug is not a requirement, we can loosen the restrictions to allow
> > 1GB gigantic pages in ZONE_MOVABLE.
> > 
> > Since 1GB can be difficult to migrate / has impacts on compaction /
> > defragmentation, we don't enable this by default. Notably, 1GB pages
> > can only be migrated if another 1GB page is available - so hot-unplug
> > will fail if such a page cannot be found.
> 
> In light of the other discussion: will it fail or will it simplt retry
> forever, until there is a free 1g page?
>
...
> > +- When an admin sets the ``movable_gigantic_pages`` sysctl to true, gigantic
> > +  pages are allowed in ZONE_MOVABLE.  This only allows migratable gigantic
> > +  pages to be allocated; however, if there are no eligible destination gigantic
> > +  pages at offline, the offlining operation will fail.
> 
> Same question here.
> 

Hah, great question. I will make a note to try this in the morning.

> Nothing else jumped at me, in general as discussed, as long as it is opt-in
> behavior
> 
> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
> 
> -- 
> Cheers
> 
> David
