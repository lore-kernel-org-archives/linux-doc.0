Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C56210A1D
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 09:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="IcaldLvk"
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CABE130
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 02:20:03 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-578b407045bso4115850a12.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 02:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698225603; x=1698830403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9LKvzwQ+kJJuy6F8sbzPBJK3ry5j/OSwVPg23+fo4o=;
        b=IcaldLvkVDGaOtNo/OYfg/78rpVL13J0ZcBeqYR3u1G79aRK+Uz5lmZnkHlh8HTu5F
         VYHVsdfFgBgz4hId659tyYcoH3O+OcFY/ED3l6DVWi1WcrabgUeHxD5Az8CfPpTtL+zG
         ZM3DoH5Rqq5ZteqVIXDav6hKsXmukSywzs08TRulWaTbHcR2ooLewjkzU6lb3qUrTw7R
         7m9WfdvYZjuzSUBez4oSk1t9wnTKwp90SehOccwcYdI/Vjy9S23CJH7QXIT9JPz9Ccni
         hOOmjfna4RJjHZSKkYYCHwrHGm8kBzYeHpHJD+rJyDJsOOw5aFS7sdipn7Mde9ptP6UV
         d1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698225603; x=1698830403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k9LKvzwQ+kJJuy6F8sbzPBJK3ry5j/OSwVPg23+fo4o=;
        b=BcZ/7hQW0e48YNx6Z5WRZksiE2L1VQp+JmjxxNxpNO3RUc9LFtXgkd7uI+e8M7uSi/
         w/hFCLwbovsX55VhCPrtjvVjQVOJdr7fIkGPuXQthH/C5D9y6D8LzdWYE3iEc+WydXiV
         i2BA11owJuaDbRFdXAsrRo3/WqFuMHdNpJ13b8BS516uB6kq0kvXomRtukhzZr5Fwixz
         GG9RdKu7gJ11/dUaFnEDx5qLpxvUcVD7+5TNOx7pfFmkzeOitbGNfCfIJhvkJzZcvlMw
         H98BpPANM0mtLt1lTAC9TYTjQTclFWUcC645qGWU4+E3xG0Gs2Al6ZwBsT1Ao3T1HEt6
         5/6w==
X-Gm-Message-State: AOJu0Yz2GZ5gF4sUpNtS4q6WjQ27lggc2wkQ36Q9NBN31DPo8MeOEEbd
	CIv6I7rOqh1OZ2DChxPj7hDQTQ==
X-Google-Smtp-Source: AGHT+IHfihGh9DaKro3ttnwboXUO0qkrr6LAJueCDPbd8CHiqmm6Eh/dzGrB6zYpq63P8X2rWNeq6A==
X-Received: by 2002:a17:90a:d24d:b0:274:c284:c83c with SMTP id o13-20020a17090ad24d00b00274c284c83cmr13222743pjw.48.1698225603087;
        Wed, 25 Oct 2023 02:20:03 -0700 (PDT)
Received: from [10.71.178.184] ([203.208.189.7])
        by smtp.gmail.com with ESMTPSA id d12-20020a17090a498c00b00278ff752eacsm8133414pjh.50.2023.10.25.02.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 02:20:02 -0700 (PDT)
Message-ID: <bf7d4005-d32c-42d9-a748-a7c421130be6@bytedance.com>
Date: Wed, 25 Oct 2023 17:19:54 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/10] maple_tree: Introduce interfaces __mt_dup() and
 mtree_dup()
To: Matthew Wilcox <willy@infradead.org>
Cc: Liam.Howlett@oracle.com, corbet@lwn.net, akpm@linux-foundation.org,
 brauner@kernel.org, surenb@google.com, michael.christie@oracle.com,
 mjguzik@gmail.com, mathieu.desnoyers@efficios.com, npiggin@gmail.com,
 peterz@infradead.org, oliver.sang@intel.com, mst@redhat.com,
 maple-tree@lists.infradead.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Peng Zhang <zhangpeng.00@bytedance.com>
References: <20231024083258.65750-1-zhangpeng.00@bytedance.com>
 <20231024083258.65750-4-zhangpeng.00@bytedance.com>
 <ZTfw1nw15wijNnCB@casper.infradead.org>
From: Peng Zhang <zhangpeng.00@bytedance.com>
In-Reply-To: <ZTfw1nw15wijNnCB@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2023/10/25 00:29, Matthew Wilcox 写道:
> On Tue, Oct 24, 2023 at 04:32:51PM +0800, Peng Zhang wrote:
>> +++ b/lib/maple_tree.c
>> @@ -4,6 +4,10 @@
>>    * Copyright (c) 2018-2022 Oracle Corporation
>>    * Authors: Liam R. Howlett <Liam.Howlett@oracle.com>
>>    *	    Matthew Wilcox <willy@infradead.org>
>> + *
>> + * Implementation of algorithm for duplicating Maple Tree
> 
> I thought you agreed that line made no sense, and you were just going to
> drop it?  just add your copyright, right under ours.
I'm sorry, I misunderstood your meaning last time. I will make
corrections in the next version. Are you saying that only the
following two lines are needed? This still needs to be confirmed
with Liam.
> 
>> + * Copyright (c) 2023 ByteDance
>> + * Author: Peng Zhang <zhangpeng.00@bytedance.com>
> 
