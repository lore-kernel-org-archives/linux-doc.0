Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB0A63AC
	for <linux-doc@vger.kernel.org>; Thu,  2 Nov 2023 09:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VYR7byUY"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7C5134
	for <linux-doc@vger.kernel.org>; Thu,  2 Nov 2023 02:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698917623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RRqMBhNNsG2GgDNN4qWp+wu4mNgU5riKYWQ5XI3db/A=;
	b=VYR7byUYoilFUXGCDM3VkHfEqOeP/63nalHG9vkJ6HVpYGmdTBwre56G3GpNFJY5Z/g1wZ
	Jn5ezhOyVgppRK56lBSLum3Vsv1ivk8NJP6RBR2OxHPxR8/eA1wIo9TzDl75VDquSdEPkd
	7i+DYvgcKdgQHiOEjcIEK3Ooy83Rf28=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-QhbhPWa5NjSiUIYFLYbTWw-1; Thu, 02 Nov 2023 05:33:41 -0400
X-MC-Unique: QhbhPWa5NjSiUIYFLYbTWw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-507cafb69e8so686882e87.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Nov 2023 02:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698917620; x=1699522420;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RRqMBhNNsG2GgDNN4qWp+wu4mNgU5riKYWQ5XI3db/A=;
        b=nGnVxE6D+UpGkfHBF8q+VVqQEJyOB1X9yw1uwjmgqZbr2/ttQ07uFrM8I28Zjh/w6k
         flAlWWbvGkicjIKDMfrl5AKmCKPyKrkSgdx9PNKzCF5xyxJ0Df7OD1chorgPDdI7P7e7
         9o0H3D/dUiryHFFZqlBrEk3sZlmTVoc8V9o5qT5BwBpJl8D/hpIjlYmTR+jIpBFypgsD
         +x9RQ1/TMzjRJvD6PVuErxoyRZP6WIFlwwDtXhW50gjpct0I7tSlj3ChS+Y07tY73To4
         ZHfgOEajjCh+3thPGjece2ut3BAoo6g8vJZzELACtDdnTG+fTK07sWB+PAanS13FbX4+
         EKRA==
X-Gm-Message-State: AOJu0YwN8QsuQ+fv9d8RBik5UgZVI5a6kkfytRhCAiTMUm1rCFm/Mc0n
	M96bV3iFGvFinNWy6tCidRKFdFR1sNfsLBtCWLogd6QuWsYkfv855pfMJkdQ3bKBps8tSasi0QB
	lwS5Ki0FWjPlzoMPzPOL5
X-Received: by 2002:a2e:9b0b:0:b0:2b9:36d5:729c with SMTP id u11-20020a2e9b0b000000b002b936d5729cmr15014336lji.47.1698917620029;
        Thu, 02 Nov 2023 02:33:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk3Ur/kxbTus79HunF7kL0yxuSMj6fTan91sSZLYut8sHel92MvzChDXeoxbPnpM+fs9EnbA==
X-Received: by 2002:a2e:9b0b:0:b0:2b9:36d5:729c with SMTP id u11-20020a2e9b0b000000b002b936d5729cmr15014322lji.47.1698917619716;
        Thu, 02 Nov 2023 02:33:39 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c154900b00407460234f9sm2208669wmg.21.2023.11.02.02.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 02:33:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Mark Brown <broonie@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Liam
 Girdwood <lgirdwood@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Tejun Heo <tj@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] regulator: core: Add option to prevent disabling unused
 regulators
In-Reply-To: <c1690b26-9004-4e5e-aa14-c61f679add12@sirena.org.uk>
References: <20231028102423.179400-1-javierm@redhat.com>
 <20231101045652.GA2897@thinkpad>
 <c1690b26-9004-4e5e-aa14-c61f679add12@sirena.org.uk>
Date: Thu, 02 Nov 2023 10:33:38 +0100
Message-ID: <875y2kh53h.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mark Brown <broonie@kernel.org> writes:

> On Wed, Nov 01, 2023 at 10:26:52AM +0530, Manivannan Sadhasivam wrote:
>
>> On the other note, I'm wondering if we could use sync_state() for handling the
>> regulator_init_complete() work. This would ensure that the regulators are only
>> disabled when all the consumers are probed.
>
> That assumes that everything defined in the DT both has a driver and has
> the driver available for the currently running kernel neither of which
> is a good assumption.

Agreed. I believe the current logic of disabling all regulators using a
workqueue is the correct thing to do.

The only better option I think is to make user-space notify the kernel
that it won't load kernel modules anymore. But the delayed work would
sill be needed, since the kernel can't make an assumption on whether
user-space will notify of this or not.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

