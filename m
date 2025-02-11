Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76BC194141
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 02:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739242252; cv=none; b=HtBgZWrtvQMwc4R+BmftTE3Ac8wnFc5eWz0Joy38pmcXAGLDwD00zpfTOHCFugeScm2CDjfa46DH/HAzAU8HkM37ZRcBL6W/xkCYYVe1eWzLMwMjZ4WNYsmGnTujRk2FNgeXHvdTbPzqaEUM6yAxynhEBteITjxHGpuH8lp0ILo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739242252; c=relaxed/simple;
	bh=VRrjI00Me/cNAVhfeUoIza0DR3FFrIOng/ndd468AvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVfd/tmQ1aU/EMJJ00uGoWVV8ZrYbcLpy67ZFMc4Dt1NwmPLNsrDC5FGfsU1Mazeteguqrw4ZiVB+l9kggOYuUmXnG5mk85MrLiEdv+umS+z9SR1g2m+qYNWqTrMKcLr2tYkLgNa9VuhuJUP9Cvm4iUCvDtpl7EC6g3zxoc0G7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=rgYTXCTj; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="rgYTXCTj"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fa7465baceso3255910a91.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 18:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1739242250; x=1739847050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Inxmkf7GXwx4Ju5kxyAeSkmwU4lkXnkfugn8Ok+jGZE=;
        b=rgYTXCTjTrFiVFmkTg61tGHzGTkr0oF0eyOk7TPQuftlxao9yeZaVrbbxIllSomAPq
         LbVbcjaDmOSOJhEHSjdEaAL6WD6f4zQyDhfPLfmgWHFOnkNeKa1kvprTji7BAKLasM6x
         faWL0+m5e8UA5hpyjFDqDeglirLafitSMlxDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739242250; x=1739847050;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Inxmkf7GXwx4Ju5kxyAeSkmwU4lkXnkfugn8Ok+jGZE=;
        b=Y9oQHkBQJMTYuhB+5q+Tvv01w+3SmFxS9pCW7VYRrytHgss5mSraS5g/DdE4bUp2j7
         S6XNIaG+HctXnK9zvGvYUKpOu7VpBQM0iXxJRdq51VAPxt9CUv6dsCWAWZ6OFcq254aC
         fzmU77FsbgkotWiBde9skUHk4z4KnwfXoMnRvqRjVzq1Ojt9T1no0s8oPwFvYYsi8dw+
         oEYS+UDiv/sqA+TVFHV4c2aQHyntojq5aR3vOVVWGJX0z1yzmDeylplM2yFelynsGQTu
         MOo9y4tiS8uT3+PV7dNxGB3seDYfh6hDXhkwSxqMGOC6vZW/96wQuIvI3FcmIfSL+eR6
         +ShA==
X-Forwarded-Encrypted: i=1; AJvYcCVwVWUCK2iQlCGHNbp0QYKM3d8KP4C9ULIoQV+FtZlJJh8K66YQ0sfdpl0xNsS7TiVM5hFtu8mGsfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ+zZhfjg1h6DqtUo/itglJ2Up8PhdLXIscyTltA454TPJKDSR
	yipmbbV202Nrl1kk6wTgIGsiPWLABfLX4+w5a8oLah5PfgGN8xxdhStihRiz6Kg=
X-Gm-Gg: ASbGncvu361dyzsmNAYWYIGhQGa0OASIjCqUKxYXgNQD4ShVjqjOoLdlrQ1A/6Z8WLw
	ajJu8A5eb4GUgfBDg0Fwb9Wuia1WVrA+R6L7ryo4R7/ALV6QdZSIKKSWLJfajDS5WUAnvwA6vin
	I88gRufc9s9a19KqKr1ExUHXja0W/BZi4L03QzF/zSdsWjxbX1Mz8hze9qyp48LVyOb3nANxtRg
	24UzrX2riAky/Jf/1uDtWCwUg5Ae/d/bb2NSAQX4FnCiys+7bFssQOyXyjvsIK+KguBPxkQaPtl
	zbT2iW+moHM78J8kllcpaJTKbpBOiFNlucm3UHjIzMuhPUbDJDNZM8T0Jrczg34=
X-Google-Smtp-Source: AGHT+IEwU9HQiodle9G1DfCEZFuDdCXwxGqXcPc3IIYwRBiVYDyT5p/hIkOvMkdFa3mITYqhW/6SIA==
X-Received: by 2002:a05:6a00:13a4:b0:730:8a0a:9f09 with SMTP id d2e1a72fcca58-7308a0aaceemr11800001b3a.18.1739242250105;
        Mon, 10 Feb 2025 18:50:50 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73085eb5facsm3577237b3a.11.2025.02.10.18.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 18:50:49 -0800 (PST)
Date: Mon, 10 Feb 2025 18:50:47 -0800
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, ahmed.zaki@intel.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] documentation: networking: Add NAPI config
Message-ID: <Z6q7B79h73ydzOhM@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	ahmed.zaki@intel.com, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20250208012822.34327-1-jdamato@fastly.com>
 <20250210181635.2c84f2e1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210181635.2c84f2e1@kernel.org>

On Mon, Feb 10, 2025 at 06:16:35PM -0800, Jakub Kicinski wrote:
> On Sat,  8 Feb 2025 01:28:21 +0000 Joe Damato wrote:
> > +Persistent NAPI config
> > +----------------------
> > +
> > +Drivers can opt-in to using a persistent NAPI configuration space by calling
> 
> Should we be more forceful? I think for new drivers the _add_config() 
> API should always be preferred given the benefits.

How about: "Drivers should opt-in ..." instead? I have no strong
preference.
