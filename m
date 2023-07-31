Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DC2C001DE
	for <linux-doc@archiver.kernel.org>; Mon, 31 Jul 2023 09:55:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbjGaJy6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Jul 2023 05:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbjGaJyb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Jul 2023 05:54:31 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2190010DC
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 02:53:06 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-563e21a6011so3233068a12.0
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 02:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690797185; x=1691401985;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+JtLVpE1c+T8lTzPshdsq+FsKMITmkXRw9+xohDxso=;
        b=NmnMeTCpG45ADvgRQUxLTcuLKqzReilHwsUkdyHXbO5BjaQY9fLOW0be7wwGBPt3Fd
         GtY/CoLQ5ulVLRqMsuir9CEI9RtZz58XDfHbyqVYPt/JSyD/PDgQwC+TE4n49JEu/3si
         GmRdVnhQQ5F0iLdVKapxuAKSQqvT2jS4qIS4h1lP92DqyFxGRX1xvvdaJ+PEOsZ7I9xI
         b7m60FRxUpqEmjmgFNS6l6MvWDoeEO/XpNBBCtoVuZuJAX+BZU8AgpQL0u+gXPXMOtsh
         sDFGkL7zoHzSDOhvSXsxLhkLURuBtZlD6Z5vLcQSjK98oJEFTuJz36IF5tC26NhHAqec
         LUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690797185; x=1691401985;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T+JtLVpE1c+T8lTzPshdsq+FsKMITmkXRw9+xohDxso=;
        b=blKTpxoM3hpU9tMBsEA47BOD7Y674c4AOAGthTp0aHPsg4na4kNY+kfdaT2CB2duRZ
         9dYHFmviPKs8db3Qmzyqo10Q+9bXF9dnSMA5gT0DpAxJzIDYSC7YlytjXVwIzo5Dz26v
         7Y+dF9PfpCm/r7sbmpqpBZcAwbQon5mufokUn4iG6ZL3q4G5SqwuQJZRJgI9za3SfJTI
         MS0gnBfnQ+ZyP+Ndc+lcU/wvmg3xb1CQ6oBsxIBu4gE71zBPVsKG2zki73+iAJAC0J8B
         ThipSBjZEf3dLPx1iPhooHWPp5hdxAGsxex4lrJZM2MGDBLQg6wjpyQzMil1YK+fxltG
         /gYg==
X-Gm-Message-State: ABy/qLYtK8tPG1FcFm26+Q6h2h/rTBvrrH1jUnO1tmBjUdu02I10pZTM
        egD3a7Fvfbb7Cr2xkW2l9znqBw==
X-Google-Smtp-Source: APBJJlFSLuhbiNV50ZKuLiiTHQLOYesPds3YhLzlcaKUyv6zvLWtkd1WU763/LuyNYaf6VVfyIALvQ==
X-Received: by 2002:a05:6a20:32aa:b0:137:3b34:93e5 with SMTP id g42-20020a056a2032aa00b001373b3493e5mr7988841pzd.59.1690797184901;
        Mon, 31 Jul 2023 02:53:04 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1c2a:1cd4:8b91:108f:bf15? ([2408:8000:b001:1:1f:58ff:f102:103])
        by smtp.gmail.com with ESMTPSA id c13-20020aa7880d000000b00640f51801e6sm5823982pfo.159.2023.07.31.02.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 02:53:04 -0700 (PDT)
Message-ID: <36f2d5d1-00ff-d8a7-ed40-15eb5d929224@bytedance.com>
Date:   Mon, 31 Jul 2023 17:52:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.1
Subject: Re: [PATCH 01/11] maple_tree: Introduce
 ma_nonleaf_data_end{_nocheck}()
To:     "Liam R. Howlett" <Liam.Howlett@Oracle.com>
References: <20230726080916.17454-1-zhangpeng.00@bytedance.com>
 <20230726080916.17454-2-zhangpeng.00@bytedance.com>
 <20230726145825.2fufoujgc5faiszq@revolver>
Cc:     corbet@lwn.net, akpm@linux-foundation.org, willy@infradead.org,
        brauner@kernel.org, surenb@google.com, michael.christie@oracle.com,
        mathieu.desnoyers@efficios.com, peterz@infradead.org,
        npiggin@gmail.com, avagin@gmail.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
From:   Peng Zhang <zhangpeng.00@bytedance.com>
In-Reply-To: <20230726145825.2fufoujgc5faiszq@revolver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2023/7/26 22:58, Liam R. Howlett 写道:
> * Peng Zhang <zhangpeng.00@bytedance.com> [230726 04:10]:
>> Introduce ma_nonleaf_data_end{_nocheck}() to get the data end of
>> non-leaf nodes without knowing the maximum value of nodes, so that any
>> ascending can be avoided even if the maximum value of nodes is not known.
>>
>> The principle is that we introduce MAPLE_ENODE to mark an ENODE, which
>> cannot be used by metadata, so we can distinguish whether it is ENODE or
>> metadata.
>>
>> The nocheck version is to avoid lockdep complaining in some scenarios
>> where no locks are held.
>>
>> Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
>> ---
>>   lib/maple_tree.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 68 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
>> index a3d602cfd030..98e4fdf6f4b9 100644
>> --- a/lib/maple_tree.c
>> +++ b/lib/maple_tree.c
>> @@ -310,12 +310,19 @@ static inline void mte_set_node_dead(struct maple_enode *mn)
>>   #define MAPLE_ENODE_TYPE_SHIFT		0x03
>>   /* Bit 2 means a NULL somewhere below */
>>   #define MAPLE_ENODE_NULL		0x04
>> +/* Bit 7 means this is an ENODE, instead of metadata */
>> +#define MAPLE_ENODE			0x80
> 
> We were saving this bit for more node types.  I don't want to use this
> bit for this reason since you could have done BFS to duplicate the tree
> using the existing way to find the node end.
We have reserved 4 bits for the node type. I don't think there will be
more than 16 node types going forward.

Even the DFS that has been implemented can use the existing way to get
the data end. I didn't use it because when walking up the tree, we don't
know the maximum value of the node, and the continuous upward walk will
introduce more overhead, which is what mas_ascend() does. Doing BFS
cannot avoid this problem also.

The reason I don't do BFS is that it has more overhead than DFS. If you
think of a tree as a graph, doing DFS will only walk each edge twice.
What if it is BFS? Since we can't use queues, we can only emulate BFS,
which additionally does something like mas_next_node() does, which
introduces more overhead than DFS. Considering only the layer of leaf
nodes, it needs to walk each edge twice. So the overhead of doing BFS is
more than DFS.
> 
> Bits are highly valuable and this is the only remaining bit.  I had
> thought about using this in Feb 2021 to see if there was metadata or
> not, but figured a way around it (using the max trick) and thus saved
> this bit for potential expansion of node types.
I thought of another way to get the maximum value of a node without
doing any extra upward walk. When doing DFS, we can use a stack to save
the maximum value of ancestor nodes. The stack size can be set to
MAPLE_HEIGHT_MAX. In this way, this bit can be reserved, and there is no
need to do a loop like mas_ascend() in order to get the maximum value.
> 
>> +
>> +static inline bool slot_is_mte(unsigned long slot)
>> +{
>> +	return slot & MAPLE_ENODE;
>> +}
>>   
>>   static inline struct maple_enode *mt_mk_node(const struct maple_node *node,
>>   					     enum maple_type type)
>>   {
>> -	return (void *)((unsigned long)node |
>> -			(type << MAPLE_ENODE_TYPE_SHIFT) | MAPLE_ENODE_NULL);
>> +	return (void *)((unsigned long)node | (type << MAPLE_ENODE_TYPE_SHIFT) |
>> +			MAPLE_ENODE_NULL | MAPLE_ENODE);
>>   }
>>   
>>   static inline void *mte_mk_root(const struct maple_enode *node)
>> @@ -1411,6 +1418,65 @@ static inline struct maple_enode *mas_start(struct ma_state *mas)
>>   	return NULL;
>>   }
>>   
>> +/*
>> + * ma_nonleaf_data_end() - Find the end of the data in a non-leaf node.
>> + * @mt: The maple tree
>> + * @node: The maple node
>> + * @type: The maple node type
>> + *
>> + * Uses metadata to find the end of the data when possible without knowing the
>> + * node maximum.
>> + *
>> + * Return: The zero indexed last slot with child.
>> + */
>> +static inline unsigned char ma_nonleaf_data_end(struct maple_tree *mt,
>> +						struct maple_node *node,
>> +						enum maple_type type)
>> +{
>> +	void __rcu **slots;
>> +	unsigned long slot;
>> +
>> +	slots = ma_slots(node, type);
>> +	slot = (unsigned long)mt_slot(mt, slots, mt_pivots[type]);
>> +	if (unlikely(slot_is_mte(slot)))
>> +		return mt_pivots[type];
>> +
>> +	return ma_meta_end(node, type);
>> +}
>> +
>> +/*
>> + * ma_nonleaf_data_end_nocheck() - Find the end of the data in a non-leaf node.
>> + * @node: The maple node
>> + * @type: The maple node type
>> + *
>> + * Uses metadata to find the end of the data when possible without knowing the
>> + * node maximum. This is the version of ma_nonleaf_data_end() that does not
>> + * check for lock held. This particular version is designed to avoid lockdep
>> + * complaining in some scenarios.
>> + *
>> + * Return: The zero indexed last slot with child.
>> + */
>> +static inline unsigned char ma_nonleaf_data_end_nocheck(struct maple_node *node,
>> +							enum maple_type type)
>> +{
>> +	void __rcu **slots;
>> +	unsigned long slot;
>> +
>> +	slots = ma_slots(node, type);
>> +	slot = (unsigned long)rcu_dereference_raw(slots[mt_pivots[type]]);
>> +	if (unlikely(slot_is_mte(slot)))
>> +		return mt_pivots[type];
>> +
>> +	return ma_meta_end(node, type);
>> +}
>> +
>> +/* See ma_nonleaf_data_end() */
>> +static inline unsigned char mte_nonleaf_data_end(struct maple_tree *mt,
>> +						 struct maple_enode *enode)
>> +{
>> +	return ma_nonleaf_data_end(mt, mte_to_node(enode), mte_node_type(enode));
>> +}
>> +
>>   /*
>>    * ma_data_end() - Find the end of the data in a node.
>>    * @node: The maple node
>> -- 
>> 2.20.1
>>
>>
