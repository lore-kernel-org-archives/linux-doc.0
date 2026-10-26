Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029944;
	b=0pb1JJTX7rvU3LVwKqdVhL2UblB485h1c3suYNvTsoMDuxcY9hGvWa0aC4JVnBL9Cbwb
	 W4L2ROV84LxAYd8OVV+K+rOc9xNGfSqiWQgtKRpV9fXX8kBziSroD9L6i1JUaRAw6/+tx
	 G09AB92en3Ys4YnE5HL2HTNWSpBoWq7jgK+P4W9SC77sYEbNDHbGulMylDOfIlbxOMvEJ
	 Mo0XdSGJp9lVSumCmAO8FNOoMDlPbv+e4rBEk/+EKcjL/oxTf7lkv+1xaUWoz/OxHZ8+1
	 933uKWlRoNt87YIP30LDXjmNnwN1kjp9LNA7Mrs1otD9aH6JFJ+nj1JaWiQPG11cuog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Date:Message-ID;
	bh=VaQMEbNe6iILjWkN+oLQ9JFAOPWDJQN9tfc/T2bNOlo=;
	b=SGkEYVlvEGfVbv4/XkvzCfeesbr7eHZcYP0P9TdbibWy9LyxD5F1PzMsliZ2AmiQJjSA
	 BweZokAbRcH0mTd1BQkZZPatXhZtAG0/tB54e5pChYDrWfEtWcG2KaxNK3GfHHQdf/Ahv
	 7Y6Df3ZHfD4Seo6pHRTciTrfEEUGbTb9Vz6lVh2K3uShPX3lKGJX9elxvw7yP0kSJG06R
	 nnLmYF/fn9T0f7qjwAGqnaGFpz/Z6K3bTbHgP5yqjVdovrKQLV19MRNbAn6lSiR2sK6OX
	 nOBAqgg1goUX/tFrN2NHz9zUyXrM2DqjS1NhaAxBZ56FYbvG7D5BR96/ASpr/IkHs/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1F9606A322
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 15:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B1F9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3ae08d3dd4fso1305692a91.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 08:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793029944; x=1793634744; darn=vger.kernel.org;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VaQMEbNe6iILjWkN+oLQ9JFAOPWDJQN9tfc/T2bNOlo=;
        b=Ix0PLRmilhzB5Xu6pIWjScPeGZ+L9r72dm0aA+xd1UGwroGHgBkEMykQUa0xdkXJsF
         ZAxysaSOMzn8ZI7anNojWi/UufVfh0gYwkLfCnUaGNLA/C8XHTC2LDbKIEUwoHEnkJnM
         xsLkaD+m4U0KBCcCYZ+yEdAAlsWUXbyQvjuZP6bioNjoMf+A8lmKoIvSaD4+CvZdrPCe
         nQjoF/R+xGmejigYy4Sa+bysdTQTqgJ61VxU1ry16qJsbQu0ri+QZRukFSgnxrotzprL
         DZnT+ho1ao3IgHohi8b4rCjGjMisi/dRqp5upZ04rrYb0aQlNuB9JK+KFvXDY20ErE0s
         /ysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029944; x=1793634744;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VaQMEbNe6iILjWkN+oLQ9JFAOPWDJQN9tfc/T2bNOlo=;
        b=j4qSsKK2TKBqjb+jnZelHkHmA8gWLPrJjUGZKPz0KFOjfBbd/rjVExelHOBe79Vh6E
         z81FLwkC1zm0bPyf5/kPMG9i/aOEZMmW8kWPQoP4OKJCGWrCxNU9s83tMCzT5Y33DrQn
         SYfclwTBw8UXLlM5lCOjaunQWfnxIL/1hB1KguLQ+8fwc5ua0pOj6tk+rDzkdndYxClw
         w7T/28/R5JjAe9p1fcl2FSy/oHzJprgkU8ot+AmJiUh4jHnknP6ADiiPaa/4tmGCTnaw
         Ba1VIeDIxXjhELFHfiRt2BW+ihdwZho6jJkUWn+Y55U0pkJRH51mPK79Rr5lW1yyG7GH
         Mb7w==
X-Forwarded-Encrypted: i=1; AKwUvBzckJ9Cn1nXR4eKR2+K6GVWG6f5KhiwkTVqZa/5PDWKn3BozlENByZP69TPt4juehHDIob+GUY+eB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6z3Na7fD0jL81xJHItYuICGvpuhzscE3byaQqCl6UUwJg8N9S
	ACp17gFREk7pkDwuVQquATHwWWsRPMegaPSb7ZyZ/2CCkFldMe8CMKKZ
X-Gm-Gg: AYBFou39byqfksich6spVk4OGeV1pjEqhDoiclMG6fN3OfJ4t1qY4xSSPMdlqrwMz01
	FMeDirLzegMfx7Vy/PC5wB2jiJDNQpQZYezkjfkDpCAJ64MEjcEMK+rnw84B4MfoHN90fZjuW4P
	9h1h6Ce1A3IJy1RmGRouxm7HQViLyVGHTy8NsaB0rZICYEbUZ5I3yRkBV1/zISr+rXHzXjiiPFW
	Q/Jz3A7EDEZ2wruZhuY73HcHpf/5/+0bEMLJ2pr9WLZMPPy8nv1nkluUbTOfxfKhRiki/jAE4pk
	JQtCGwlC+szA5hyjIr2H4LvJkTlIA27ACayGYEluH8JMpGnsn8n6HbBGWVAI2YOc3Cgi9X9HXpE
	nlhiWjmT/GN1Vq58dDu5jsocHZsixiHSdvDpHBdEoc4lJs9KHS7U+13TnPNAC0xNsdfZz1wtPnG
	fdRy2Wn7a93WyU99MV/HZLsqILFZo7QTmOYaHxGijK1IpMY8YatIniyvaKm/wtLnC+VcWoqd6aL
	3swAlKSCwLI0qUKnAQRaCrt/lurEvxesn4CJbPaCAfWA0R1FIaw1DT6usS7u/m8Vxxu+BCETIYJ
	AuXiC7qDN/Z1yzFnG5EOJtnw8hJ2HVh1HEOtiNsmZ+xhsB1wHxqGag==
X-Received: by 2002:a17:90b:55ce:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3adead57ccdmr6255798a91.10.1793029943804;
        Mon, 26 Oct 2026 08:52:23 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40427782sm48676a91.4.2026.10.26.08.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:52:23 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 damon@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] Docs/admin-guide/mm/damon/start: fix grammar
In-Reply-To: <20261026142927.149910-1-sj@kernel.org>
References: <b0d8d0ceda82e303262c0f61324fe8a84fd9f745.camel@mailbox.org>
 <20261026142927.149910-1-sj@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 27 Oct 2026 02:50:54 +1100
Message-ID: <179302985413.2.2084375678408090049.damon-docs-reply-01-start@gmail.com>

Hi SJ and Manuel,

On Mon, 26 Oct 2026 07:29:26 -0700, SJ Park wrote:

> My intention was saying DAMO is commanding DAMON to monitor the process.
> So I find Aveline's version is slightly better.

Agreed. Both "start" and "make" depend on "asks DAMO to", so I'd keep
"make" here.

> Looks good.  Unless Aveline objects or do this by themselves with
> revisioning, I will add this change when I apply this patch to
> damon/next.

Those two fixes look good to me too. Please include them when
applying, SJ. Thank you both for reviewing.

Thanks,
Aveline Noir
