Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C412BEFFD
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 16:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780848296; cv=none; b=K5dr7D5GkdhCgGLZt86dPPaqHrsGEzX3vcfzVC1FbFuAMptPbUFcyJZroxgTTyrMUSiMVhQ3T29qF4bfEv7epeGxXFr8eltuHmbM5sD+hbqxfScG+SogBAF6OXumoTI8nTjeWnDKj/bhDVqx131aiVrKtdqJC9ax21LXHs8FEzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780848296; c=relaxed/simple;
	bh=eK8MSldLeofL6fbYcJNtrJmeIPFDwpepphNpG1jidfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5Q7w178aU9bDmZbf5I5EzF8WCbg9axfvbFehIYh39xVt6N6uAWsWa9yniO8FEfA+5NpXqq/Dlm6zNQgbC32eD8yXOKytaowv/okBXSoqY4E4Q55F1AXwqDtMR0WWmiReiorWdOxHm/vdEQe0WttyehSz5kAA35Zq5qtNFYBccc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aG0tHHhG; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aG0tHHhG"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-460166910e6so1749471f8f.2
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 09:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780848292; x=1781453092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eK8MSldLeofL6fbYcJNtrJmeIPFDwpepphNpG1jidfI=;
        b=aG0tHHhGNddc69ovQ3FRnBPZM/RXmmkhftdY7RM5+GzUdqU9kM/2gpzYesd2VnqwZP
         2DBYb/DzG10Oi3fOda7YDtoKosauph+IG1DGDL2835beDtPznMuhF0zl2A/ealE8hlti
         m+CIzK1z4iyxH7jEjySRohbnsrSMn6oxX+tpd1/35dTx9ECHD+CMRWniSQRUqPoQAXXZ
         JjgG5kLgYEa7UqkhvCnBmlzYsnya5LTwy99pwS5J+fvVqIdPegrcNqfvMrs1mvcbtuMP
         O9Pk+Zju0eiX56vkCedxvesaCLnKO3YZAu7KOvG9zCno3fa1TVx0WjlvKJlqktDStrS8
         F0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780848292; x=1781453092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eK8MSldLeofL6fbYcJNtrJmeIPFDwpepphNpG1jidfI=;
        b=N9mFhrTRDibO/KArWqGaLJxBcHUViOmJHMdaLwIYMFemN8NIU12MYRsDC+tPAThVuJ
         n/Cqxt2Z4+ImuphAz1UDt/2RzqUAszyjE2eoDXTT9AbkcBdHRl/sZS8h1fZ70DDUYsRC
         hucsg/10inhl8j+oO60Y5kLZF5H2KEL2E4JM6OxWkJgr2RggWJNfOuJDHfmCahQV4nA6
         MyL4eT6t+M10fyuOip9Jg238BWUGY7RZOUYIMUuVLpaECHyTE5tYp5nu1Bc3LR/Sbvjf
         mnTu3Gy2XzViKmnRRYorgX+DZo2deF8xku3VBkESkwE1NulwmEQDO1LfI7TjuweqxAG7
         gTdg==
X-Forwarded-Encrypted: i=1; AFNElJ8LY6EWTP6AUowJBC4+Ur1ycdApwEkvo7CJ0VCxfKXXw6OP/C8xQuS4DfZGZC/Op68Tjs1/tLqJCnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDClpp2ZX4GoqQc+A1ncvR3emot8K3LIh4yyeKf78hgJUWq3s2
	IC6JYZWwFyjnbKOYjChTVuKO2IQqpDZ6oOF3D/YKDlzFLTJoPxBNGSFi
X-Gm-Gg: Acq92OHSr8nHuiq3YUIz2TEWmUogIGP5xattGGkfX6oXNhdmZWj8bG3+VplKxtSqQ4/
	HtUVNaEUYJGOBqJC34C7Dp9ZmR64Kuhb0gRy5xTg0PKdNuzwFb91QdyLZYIP5v1fMtYyMEZp81P
	acwcRTWpxhB2CE/Ka/NhJKIK7oI+s1lRmLA4CuSc/Po3Ht5q4tBl5smbJzz9wj/vb8Il4SWgKho
	GdGbjTNGaQ09L34FwOPp1wS3ygfKIM4ULTyRk911zE5Zy4KkHoJq2+kSG8dA4kQ7eCBQWtBtVHA
	hij8tu4dzygnrJj8tp6aU4RZymjzuaCnUs3EkSlGBJeO2BLXvDhl6Oc3leogFz5+Povg99DW1Fj
	kby1CCjIQ1SKAi1DICX/e2xIqFnoOmEpoSYTr+RQjQiF4yaRIFnrs4xpg7Z0OPHRwXjus13R7a/
	aPVxoYAF33M6egBwFU99EAetp6IsFfEmLmheq9TOm4n+Tad2z92EgPqXDQyEK8qBqAAqqECInPs
	DbqDzNjj7zogcLxo5tN4pJ6yGbxQ02NWpRaOb1ZO1SG
X-Received: by 2002:a05:6000:2994:10b0:460:3233:f991 with SMTP id ffacd0b85a97d-4603233f9e2mr13227043f8f.40.1780848291905;
        Sun, 07 Jun 2026 09:04:51 -0700 (PDT)
Received: from fedora (cpc92878-cmbg18-2-0-cust539.5-4.cable.virginm.net. [86.16.54.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm41826482f8f.8.2026.06.07.09.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 09:04:51 -0700 (PDT)
Date: Sun, 7 Jun 2026 17:04:49 +0100
From: Vishal Moola <vishal.moola@gmail.com>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Kees Cook <kees@kernel.org>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/mm/slab: document cache isolation with
 SLAB_NO_MERGE
Message-ID: <aiWWoUuQyADfIA7I@fedora>
References: <20260606155856.15548-1-med08elkadiri@gmail.com>
 <20260607070645.9559-1-med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607070645.9559-1-med08elkadiri@gmail.com>

On Sun, Jun 07, 2026 at 08:06:45AM +0100, Mohammed EL Kadiri wrote:
> Add documentation to slab.rst explaining when and how to use
> SLAB_NO_MERGE to protect security-critical slab caches from
> cross-cache heap exploitation.

Thanks for helping improve the documentation. I haven't looked at the
patch, but have some comments in regards to the process.

We prefer to send new iterations of patches as separate threads,
with the exception being small fixes/cleanups.

Also, I'd recommend waiting a bit longer between versions to let the
maintainers comment since getting documentation is pretty particular.
