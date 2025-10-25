Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9495229B224
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 23:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761436166; cv=none; b=C6W7yy34pWZzn2Qx3Y6Nt5lXi0cw6WJBCCUnTmmyQpJ9rQNXHtEMfNqIPEUkpj+OsCEywn8dKpgocavwpVgmY7A0k2Z8TWwCJzwVjNIFbZcdw7sZNpd7gmcRk3ntYagkAIiQTpbEWqGbgcaZrwz7L0BT/naXYvR53hMcZJXX2OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761436166; c=relaxed/simple;
	bh=u2zY2AE1iCLjSF/2YQo0jceAk9y6aNlvx+a5Lo8HZPw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=DJQsgQ9ZLiqh7GIfX8OwYo8yT92VJ72xF4cgEYZh29G3rC+pPC7L2bm/wGMN/+97iSglnR28W8shUva2R9dwa+Nh01S+it8rTy9JSRinvOf6QfuSQV0Lw3Hp56sszXeNmJWGDTvjqnhLgr44mEPpJN7kqzUbZt5qvfyD3n3kVbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NZ8+7J+e; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NZ8+7J+e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Hf98TEhbNhtjfzWeAc9Z+k3ltUnsEbaa5JaKVbgMaiw=; b=NZ8+7J+er8CuuNo/CF1uBSoHlx
	HBaNxZLMOyIQJgXSa1Irk3Xs6Yk8/cTyjU70/ZCdYzfTyM2QZcsOUxJtb2rPcehPgobSCl9LqL1sL
	sumXRwI5CPYwckLyAkBZ5A63AARlBUC9/FtOcr/DAYmXziW4nkrvLQFkt3Zw05iIgbrC619/mqPvl
	K8ra8EERq8kCrAhRVZU2GdeqAQsSfIVacvsWlkC5IcPVHP/JJD6f3yjQStV3tcdhgtLdzroaXhpwm
	SpEs6M28odtPZbvKMah1HIP0FMB3mT4WfQnHeRE/UjWtQpY/BQYbmyXTWLSwamour+X1aNQYjsHSH
	tos/fOAA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCo0h-0000000BrK2-0JQQ;
	Sat, 25 Oct 2025 23:49:23 +0000
Message-ID: <efbccba7-7377-409d-9d0a-4e99b464e2ab@infradead.org>
Date: Sat, 25 Oct 2025 16:49:21 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: about make mandocs warnings
To: Linux Documentation <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,


'make mandocs' on the full kernel tree generates a little over 10,000
lines of Warning:s.  Then it says:
  Warning: kernel-doc returned 138 warnings

What does that number mean?

kernel-doc is doing a very good job at finding issues in kernel-doc
notation, but there are a few cases of erroneous reporting. These are not
numerous and may not be worth much effort to fix them, although
some of them should not take much effort (I think). But I am just
reporting these in case someone wants to fix them.


Examples:

Warning: drivers/misc/vmw_balloon.c:259 struct member '5' not described in 'vmballoon_batch_entry'
"5" is part of an expression "PAGE_SHIFT - 5" for number of bits in a bitfield:
struct vmballoon_batch_entry {
	u64 status : 5;
	u64 reserved : PAGE_SHIFT - 5;
	u64 pfn : 52;
} __packed;

Warning: net/netfilter/nft_set_pipapo.h:102 union member '32' not described in 'nft_pipapo_map_bucket'
"32" is part of a static_assert() expression. Probably just
ignore the entire static_assert() [any number of lines].


Warning: include/linux/hrtimer_types.h:47 Invalid param: enum hrtimer_restart            (*__private function)(struct hrtimer *)
Warning: include/linux/hrtimer_types.h:47 struct member 'enum hrtimer_restart            (*__private function' not described in 'hrtimer'
"__private" is an attribute from <linux/compiler_types.h> and the
struct member here should be "function", which is described.


Warning: include/linux/rethook.h:38 Invalid param: void (__rcu *handler) (struct rethook_node *, void *, unsigned long, struct pt_regs *)
Warning: include/linux/rethook.h:38 struct member 'void (__rcu *handler' not described in 'rethook'
"__rcu" is an attribute from <linux/compiler_types.h> and the
struct member here is "handler", which is described.

Warning: security/ipe/hooks.c:54 function parameter '__always_unused' not described in 'ipe_mmap_file'
Warning: security/ipe/hooks.c:82 function parameter '__always_unused' not described in 'ipe_file_mprotect'
"__always_unused" is an attribute from <linux/compiler_attributes.h>.



Warning: security/landlock/fs.c:765 Invalid param: layer_mask_t (*const layer_masks_parent1)[LANDLOCK_NUM_ACCESS_FS]
Warning: security/landlock/fs.c:765 function parameter 'layer_mask_t (*const layer_masks_parent1' not described in 'is_access_to_paths_allowed'
Warning: security/landlock/fs.c:765 Invalid param: layer_mask_t (*const layer_masks_parent2)[LANDLOCK_NUM_ACCESS_FS]
Warning: security/landlock/fs.c:765 function parameter 'layer_mask_t (*const layer_masks_parent2' not described in 'is_access_to_paths_allowed'
@layer_masks_parent1 and @layer_masks_parent2 are described in kernel-doc.

Warning: security/landlock/fs.c:1142 Invalid param: layer_mask_t (*const layer_masks_dom)[LANDLOCK_NUM_ACCESS_FS]
Warning: security/landlock/fs.c:1142 function parameter 'layer_mask_t (*const layer_masks_dom' not described in 'collect_domain_accesses'
@layer_masks_dom is described in kernel-doc.

Warning: security/landlock/ruleset.c:210 Invalid param: const struct landlock_layer (*const layers)[]
Warning: security/landlock/ruleset.c:210 function parameter 'const struct landlock_layer (*const layers' not described in 'insert_rule'
@layers is described in kernel-doc.

Warning: security/landlock/ruleset.c:693 Invalid param: layer_mask_t (*const layer_masks)[]
Warning: security/landlock/ruleset.c:693 function parameter 'layer_mask_t (*const layer_masks' not described in 'landlock_init_layer_masks'
@layer_masks is described in kernel-doc.



Note: hundreds (probably thousands) of the mandocs warnings would disappear
if kernel-doc accepted '-' in addition to ':' as a function parameter
or struct/union/enum member separator (like it does for
function/struct/union/enum short description).

-- 
~Randy

