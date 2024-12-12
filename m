Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D412139DD
	for <linux-doc@vger.kernel.org>; Thu, 12 Dec 2024 11:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734004342; cv=none; b=mowU1jR4idK34mtDPEvvslQIqy3ORUiJKWwzOTzcxdjbpL9ShcTuKpaNmfTKtuuRXf3FbIKIqwlF5LKURHglsgdwbAAOtPEmcriv/fIV40gTrB1sMqDhwRsqcj0EIb4vcURyfPONPz3fb928A0wT1F5bhCk7rbArOoYMlOeZWNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734004342; c=relaxed/simple;
	bh=03RLHQIxmlqsUGfZhGuFm/JltRi9jnj0chF1CLFHW4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9OVz83waMN0++n3xFtZpg7XaIsrj7/lc0vWdfSYddVswaMIqtH1A4GFLd9VPUydm++Zh8Kmvdbq5h6TR2sZcttpDG/wX8DLAqotVfoCT+uYjbb59hmdD8xGRCfUkXc0FQ2/obyxommr4GuHgKIZ0fUBWN4g5ReLaMAt61+vzzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EYsLYxtS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EYsLYxtS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734004339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=exOqWP2BDOKiBjUw7UxafSDVojWNBvZ5jScU+cvyEpQ=;
	b=EYsLYxtSQZCy/4KivcDV5FYHR074p50zEwPOacfvLMF52qcRINgI0miQcv1ctMIpLfMfK8
	/gJAobrJ4ugWT14VkZZL1fMNpzip0s0TlGdE2YOJhsPAQKCmQTJRiKbSQu3VDrKGvsZhZv
	gw7qnN0JOkEl/opjKu/DY0MaRtsyX2U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-wPk-lNKMOtqI98MTcZP_QA-1; Thu, 12 Dec 2024 06:52:18 -0500
X-MC-Unique: wPk-lNKMOtqI98MTcZP_QA-1
X-Mimecast-MFC-AGG-ID: wPk-lNKMOtqI98MTcZP_QA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385e2579507so204625f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Dec 2024 03:52:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734004337; x=1734609137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exOqWP2BDOKiBjUw7UxafSDVojWNBvZ5jScU+cvyEpQ=;
        b=OaK1F+r77uSGe3gE9o86L375iETb/PHReyCqp9qhLGNgb5kPovg+dpqvizrzbm7GI7
         VIFpR1xZrcUT+QcMhNpbRoXdOEXusJURXmchbMFafN6fbUTt27QC2N3qm6I/wd26lFWr
         uRfJAkPKildAGWt3o7XuYGe5bfksTvafFSZYKEpwRnGrDSqi0wlRdicGP9lu2l7fzqD9
         THQNKIjat0EB0GSpYdE7fHCcXWBBHItDdXJMi1dBmReF7Qj8ETMjkOIRoYYLj2KWoiet
         oah5h3DeT6pXCuHZkq3AJYP9h2RVMqZnkXwSJP3Qgvy3bXM72Qzb3XRh7cR6mchkK4QQ
         6ixw==
X-Gm-Message-State: AOJu0Yw44DYcJ9EZ/w5e3B4niVFdn32vSMCnBtr+iKrDZTrI26cxqaXi
	9igFxz68oNGjbfKhXJ9d8HxLRLF3nMfUOhD1MGe68xyztAfexvJ4gXgb/9OOSSGLt5SVUSLYlf4
	cUt0Oa5dZI9As4tpjRI/y2lt8iUSuzzCz/lSybnIPoaG1fPa3yRZ69Mc+NA==
X-Gm-Gg: ASbGncuyVMr0K/Ix2vArv/NJioWRnVCZJ7mShiaASvoq2eJGyrJu1o3dQG96rajpGTD
	pLiw6DEMnHqaKhQyFnZSiuOgJEEqgoSjvNAbS0FhmBF7PEQF1Xz9HrLb9Yf7hhEpNMAuwNsZ8SL
	+ZUhLrHXT/ClAwszmjjta1tG6KriO/TZmxFbfXij1qZ5xCGz7HMZymJ30soQTcWWqWS6aFFtx9W
	AC6YmfivhgiYXWq9Os8j33Xlz/Zy9/refROEK2eMqt9yMB3i2vX+vvLFRgSqdOo74JowUFS8IS0
	lwSoZ1mjarvWZHJtbDPLZd40gIX3d1R7nT73zpgdPmY=
X-Received: by 2002:a05:6000:4819:b0:385:e13c:5406 with SMTP id ffacd0b85a97d-3878768e893mr2859490f8f.21.1734004337360;
        Thu, 12 Dec 2024 03:52:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3N8A0Ggwd5o/UsJAbeJrpIatw0dxmVjtUtM1F9p6Q9Qhx0chkYeFNKJKkp3A9C3hhq3niCQ==
X-Received: by 2002:a05:6000:4819:b0:385:e13c:5406 with SMTP id ffacd0b85a97d-3878768e893mr2859479f8f.21.1734004337064;
        Thu, 12 Dec 2024 03:52:17 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb (host-80-47-197-226.as13285.net. [80.47.197.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878251dbbfsm3774727f8f.97.2024.12.12.03.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 03:52:16 -0800 (PST)
Date: Thu, 12 Dec 2024 11:52:15 +0000
From: Juri Lelli <juri.lelli@redhat.com>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Frederic Weisbecker <fweisbecker@suse.com>
Subject: Re: [PATCH] Documentation: sched/RT: Update paragraphs about RT
 bandwidth control
Message-ID: <Z1rOb9D29H8ZCNqd@jlelli-thinkpadt14gen4.remote.csb>
References: <20241211170052.2449581-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241211170052.2449581-1-mkoutny@suse.com>

Hi,

On 11/12/24 18:00, Michal Koutný wrote:
> This has slightly changed with the introduction of fair_server.
> Update the most relevant parts.
> 
> Link: https://lore.kernel.org/r/Z0c8S8i3qt7SEU14@jlelli-thinkpadt14gen4.remote.csb/
> Signed-off-by: Michal Koutný <mkoutny@suse.com>

Looks good to me.

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Best,
Juri

