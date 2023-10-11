Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5642031D
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NgbiRjYm"
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C442693
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 08:42:39 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c9a1762b43so26382255ad.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 08:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1697038959; x=1697643759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLH0umzVzkzMlLL505+WdiJ0FY1Sury7B+CiECVSeNs=;
        b=NgbiRjYmhJ5Bk16WR5oC6CrM/U+56tmh0Pgr+rPI16qxlwBdEivylL2DtQxcnTTPme
         Se0kAfIKLqghW5gceJlHV4FYS9mDyWUwssLDwpEh84Z4GwV8EyqMiaAIC8w89p4EWaZy
         aFZl/g+ZP+ktOy6vNVVfDpiY+uEjvEiWWIEiCLbm4WA/+Bl54svT+chdsRFmiTFPqNPN
         4eUNd0svrqpTLXJPbfktGpjR+lB3aSCDrN8Wy3xoYMJGZU005JBLsPGKcwmI2FzxW8kv
         e0dd+XpueecjdYRsRxvAlu5RA81zaI0BFcUIv/5Dp5iDjHa2QGG3jWGr+hgzCku7/nQV
         2Upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697038959; x=1697643759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cLH0umzVzkzMlLL505+WdiJ0FY1Sury7B+CiECVSeNs=;
        b=nqlxk411AnGACW04IA0vr9gPukx1xQ3iYGyCTRnksbFucnwhXAEGAyJNqG2oJcRWmn
         RLNknZxv2vUFTZV/KqVscf8fACKRIvGIFc+6icT1cJpUhZGE0ls8j7Y/7STiLaumOU8l
         KwLc4/VPuugT3ic4WjScfVmsWZ2SswOICpIiR+oMvt3cbzgtno0NA3eKRhOaBV1CgWdH
         NoeVVfeB3dckQZ1JkeW/wXI3LnRLdgAUnGpvRPO0+U39/msv9nG5YTplWajzaV01tDLJ
         r7zjWEHrUx3gq/9QqjQkKJ41MjkjsnCZBse/wFpovDkiE8t+gasRTTNOWwJ+fPRv4X3i
         Z7SQ==
X-Gm-Message-State: AOJu0YzppyAuml3xBpXcxvWwkwxhAMXX+NseA0+hQYLn04MX56F4VI2D
	NKB08tfZaxV6q28jyEUE49Cg4g==
X-Google-Smtp-Source: AGHT+IGPdhqvnqVeFNJs68w/YbZwkSpWls5CnBMwSw9bjKEbdwdMVO/Hv7EShENVpIrvfdotYi32RQ==
X-Received: by 2002:a17:902:7893:b0:1bc:6c8:cded with SMTP id q19-20020a170902789300b001bc06c8cdedmr20157796pll.67.1697038959247;
        Wed, 11 Oct 2023 08:42:39 -0700 (PDT)
Received: from [10.4.181.228] ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id g5-20020a170902c38500b001c60e7bf5besm14039387plg.281.2023.10.11.08.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 08:42:38 -0700 (PDT)
Message-ID: <1632d0e6-2d52-43b1-8a01-056231c0819d@bytedance.com>
Date: Wed, 11 Oct 2023 23:42:30 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] maple_tree: Preserve the tree attributes when
 destroying maple tree
To: Liam.Howlett@oracle.com
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Peng Zhang <zhangpeng.00@bytedance.com>,
 corbet@lwn.net, akpm@linux-foundation.org, willy@infradead.org,
 brauner@kernel.org, surenb@google.com, michael.christie@oracle.com,
 mjguzik@gmail.com, mathieu.desnoyers@efficios.com, npiggin@gmail.com,
 peterz@infradead.org, oliver.sang@intel.com, mst@redhat.com
References: <20231009090320.64565-1-zhangpeng.00@bytedance.com>
 <20231009090320.64565-10-zhangpeng.00@bytedance.com>
From: Peng Zhang <zhangpeng.00@bytedance.com>
In-Reply-To: <20231009090320.64565-10-zhangpeng.00@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



在 2023/10/9 17:03, Peng Zhang 写道:
> When destroying maple tree, preserve its attributes and then turn it
> into an empty tree. This allows it to be reused without needing to be
> reinitialized.
> 
> Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
> ---
>   lib/maple_tree.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index d5544382ff15..1745242092fb 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -6775,7 +6775,7 @@ void __mt_destroy(struct maple_tree *mt)
>   	if (xa_is_node(root))
>   		mte_destroy_walk(root, mt);
>   
> -	mt->ma_flags = 0;
> +	mt->ma_flags = mt_attr(mt)If I put everything into exit_mmap() for handling, this patch would
not be necessary. But I think this patch is reasonable as it simply
deletes all elements without requiring us to reinitialize the tree.
What do you think?
>   }
>   EXPORT_SYMBOL_GPL(__mt_destroy);
>   
