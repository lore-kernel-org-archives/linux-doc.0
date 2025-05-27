Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C43D25DAE1
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 15:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359446; cv=none; b=PuC4zGQNQcg8Afzu5+tkZ+tbA0SfBN3qDbItUJ3V61n8nJB5I4gLz7Yh47Inke1NB8f4IzGcxSiVTatPqOjajA1y9bfNmODwkNW5SVZ68qE+qFEebin5mYRiZITHClaLf/eaoQJWu3UuRL/YPq9uFB4qSeeOMRn3s4/ug9jcAgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359446; c=relaxed/simple;
	bh=GHFKB1QUQJNQTrqD2WwkKwhukhmmQnO6znL7tsSrETk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoCx/WlnXXFhk6pqKEx9dDoZg/NMHqa916Bm1udBboEEMvhnVoMyZkcLZSN30tLTEDFhSegZGiv3VLl24Sh4thO74f476goru1eyrRj2Kkq+bzjUDbAKEF/X3ce5cWMQIMDIKJ7pbErpPcFKhuqLDTEIntXfWbCnC3LWDuIKaO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YresutXN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YresutXN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748359444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I9jwVu8HrDPFPJMGQ2KQGHA1uhYe2Oc6mR5giQLGgIM=;
	b=YresutXNmbgijlNutS8S4HB/PZY5CHT8CkvOfqMD56mQFXjwlDLaCBk7DMp0Ri9SO1irNT
	7DtQzev7zRG8YRzbqP8DyyLKkb8PwpqIUZ01137tSNk4mWTEXFOzL76POuzL5/bDAAi2U7
	XKbU6NgVxN6kuaBlOZEumUOHmjgI7ds=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-1a5u4j7sM2KRTYkR0-W6cA-1; Tue, 27 May 2025 11:24:02 -0400
X-MC-Unique: 1a5u4j7sM2KRTYkR0-W6cA-1
X-Mimecast-MFC-AGG-ID: 1a5u4j7sM2KRTYkR0-W6cA_1748359441
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a36bbfbd96so1263629f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 08:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359441; x=1748964241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9jwVu8HrDPFPJMGQ2KQGHA1uhYe2Oc6mR5giQLGgIM=;
        b=wKO9ozFx8pbqFRYosqcwrdpvIhHEQxreUYoH8EnnXLHgG3Rg76YYlH9/6JmyeHfX+a
         kZUXuSY6STSfXJNya48CnaGhuPSy5kQmIK1OZsh2eJASfK6DI0VAVfKLiD7Jhe6elHww
         +yqJPkhTc4C3+uW94oIYIOf0pEr6JB7BQXBXJiOIJtTJzD3yyGrWWIdLG18q/lQWhYsv
         +qdk3YBxMzyQnO34/irkYrAObE3v2HQC/GltiiFfV8FQP5689thED1iTmAV8fV4HlVox
         CzKCOvW5ktxZ2goQie0l/4qtl2+/im0cSqKe7Tx07ZYyUbIcsbGtRCYm07JhDscdwNB6
         ocDQ==
X-Forwarded-Encrypted: i=1; AJvYcCULHFTqpAtTaT5H8fI3mFIhMPU1XiuVylwsaTWte6FuQY6JMsptAMpgIe7GUSCjVQfe9QqHG8OMKys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvw1zVvKhYHVFgwj9hwEhZQhMPPj82spl/BtdTKNwmFZW6YU5n
	jEVBV1IVDXK50g7wweyczKOfF1c5AwBuyXNJPhs30G/oNRfEHPfKbwzPiIf9WLql2KAvlFXTOMa
	8b7fu59OuVvno3UB3cscQA0ytUz+3ooRKcHyfi+Hke013ZMHxICWj/7ggCZoxvw==
X-Gm-Gg: ASbGncs4c5VeL8xbOzWz/lmY35SdFSGS8F5UeA7qOsnfClJSaTQJ8gmwBOpowV53SZZ
	gqYBgrC5XqlE08BbNAoWIauJVzNx/UUIR1GNXRL06VNEnHXwoXO7oUbinhPxklCcmKJCGxlxvNl
	RrIFd00uxqrBnD+IImArpq50pn2r7fCyYO/jQ+Sj1aVU0IEZylVHmgpTG5+3aj2N8KtPY74Rh63
	3tcXiL+hEk39xmCAjQ+9mVj9Saju63qhAVYLJj1WlqCo4sRY/u7tKlX9pSzsPEbSyxONGSOuLkE
	2FMb+Y/sSoCn02uhblhNDejLDmBoaFag0Hau8CRQag==
X-Received: by 2002:a05:6000:1a8d:b0:3a4:c713:7e6 with SMTP id ffacd0b85a97d-3a4cb40911dmr11430888f8f.11.1748359441170;
        Tue, 27 May 2025 08:24:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHRVmqgl3pua6Auz/RYFYwGKLeA+VXh5dWAlPWu0bWW36b7NjZ8rN7M3F6n2Wa8Dc6jXSsuw==
X-Received: by 2002:a05:6000:1a8d:b0:3a4:c713:7e6 with SMTP id ffacd0b85a97d-3a4cb40911dmr11430867f8f.11.1748359440792;
        Tue, 27 May 2025 08:24:00 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.57.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4e6934f30sm307781f8f.18.2025.05.27.08.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:24:00 -0700 (PDT)
Date: Tue, 27 May 2025 17:23:58 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shinya Takumi <shinya.takumi@sony.com>
Subject: Re: [PATCH v2 0/2] sched_deadline, docs: update rt-app examples, add
 cgroup v2 cpuset HOWTO
Message-ID: <aDXZDvzghkimV7A4@jlelli-thinkpadt14gen4.remote.csb>
References: <20250527-sched-deadline-cpu-affinity-v2-0-b8b40a4feefa@sony.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-sched-deadline-cpu-affinity-v2-0-b8b40a4feefa@sony.com>

Hi!

On 27/05/25 23:55, Shashank Balaji wrote:
> The main goal of this patchset is to add the cgroup v2 cpuset controller HOWTO.
> In v1 of this series, Juri commented that rt-app no longer takes command-line
> options. So I ended up converting the rt-app examples to either use chrt instead
> or use config.json.
> 
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
> Changes in v2:
> - update rt-app examples to either use a chrt example or use config.json
> - Link to v1: https://lore.kernel.org/r/20250522-sched-deadline-cpu-affinity-v1-1-2172c683acac@sony.com
> 
> ---
> Shashank Balaji (2):
>       sched_deadline, docs: replace rt-app examples with chrt or use config.json
>       sched_deadline, docs: add affinity setting with cgroup2 cpuset controller
> 
>  Documentation/scheduler/sched-deadline.rst | 77 ++++++++++++++++++++----------
>  1 file changed, 53 insertions(+), 24 deletions(-)

Looks good to me, thanks!

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Best,
Juri

