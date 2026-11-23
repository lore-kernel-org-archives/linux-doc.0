Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442486;
	b=zPUzTQrDJIrgOs0NBbyU98jMyVbP1TntxBuCVdTGJqU7vZIu9o15sHwDoGsCTZWhsRxU
	 KkKm1f1dxRNTZ5YLhKdCCC6PmyNJXwE0od8xjgrxhCEh1R5EgjCtYaJTnE5Rl0WZqh9vC
	 d80eoh/7svsrm7fW0mUyQRGoXGD9Z1z1f0/mFVS39n/i+19x9Kv47WdERtLgN8UkK4S0A
	 gaJ5s6JVizvW2YuczKIWEScPdDl/PX9SO4KV7Ba/sbPBInR+d6UDQBWc/n4v2/tywlNFb
	 Co1TKsCA0vK9/SgmxCZYRRWR3JB1f5uh+ssYKk+0qJQP/TqcUi5JaqTvotda/5v2YfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=vG8DGIHiY7DMGeo+eA0u14jrv8r12vq2uH5/qp0e+4w=;
	b=FOkwL/5UznQlM3WNZ+AoYInlEBmSK8uucvXyS+PRUWHMgVTFpvGZxEwq3wxn6eDH0bE7
	 A0ptC+YeH7z2RTvuQeADNmpxjaGo+wyKJZRCn4zULAvWi0/mzErjW/9PcI2OXinoL4IpT
	 3bJ0ZlLvFHIi/pzwJ4zoOmVJ9WVenikcNiJc/vFeyZsVNo4GDumU88hVW2mUFKaa/ouUN
	 +qQ+TgQsMv3SiN2VCz6mSr8gELhFzN+yG04IR+Xro+Ykz2inYcviSJckrXBOn85VZBtcP
	 JiZSBy2SbXR2iemGn7adNqqT1uUbtWsezqFcH/N1HN3XnRQm2iDIbaJYk2/glji8NWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=HvoqpFfv;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E2D606A32D
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 14:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0E2D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=HvoqpFfv
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-55d30c054dfso37594951cf.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 06:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795442485; x=1796047285; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vG8DGIHiY7DMGeo+eA0u14jrv8r12vq2uH5/qp0e+4w=;
        b=HvoqpFfvQJEyD7yCLKdxLSgIAzaLXp3MuIOJlQD/xTNp3eiDg6Ra/gTk2UwtMg8a7r
         51Fdi8rwbAEzrbgpfyQRcX6ocwx3JbZqs3lMtg+oSCOxztbX4sMSEqwzwBMMXIZhbH2z
         +cWKiZlrDbUnOjK2Dc/xmxc6lhEP7P0zCv9fK8Q6R+LbGf8sSkVAJ3VI047utN/3Xvv4
         E+aRxCbXLC4Q26EJEfMDphlos6jB6B2Elx2CW7JhFNTETwNm4m8/cfY28pwtDbaTGmPb
         vBtJ7fUBmY372UX/XLhDP7oxTPwPWEyn4GbQKKsOdOJ00EB3fq5g2EwkvonKgUxXTVD5
         DPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442485; x=1796047285;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vG8DGIHiY7DMGeo+eA0u14jrv8r12vq2uH5/qp0e+4w=;
        b=AMBkPzc54SqjdpwQs5cUNZrrdS7B9xJ2ykPQUH5+4yw4XhDcWk9I2ZXu9N0EDlYlrU
         5aan8iYKHq0bub8SzxpBSjqKRT5carG3kqADyCUZT0EKdTD85FW66n/viLblW6ttmnSK
         ldBoiKS7IWdZHiSMIvDcdHGT2sXxCSbjjR/TVZ4NGXlQ82jSm9xSp/3f2Iowrmz2Yhxp
         xR5Uvw1GiQwsfJ4BFMbsCCAyLwW3l8lbJlpcxBawS5Ve0JLnpkE4lLBCSqOP/ehuoLgl
         R/PifsYq0Iw1+KrdGuh1UU1Oe+e4OjmxHEEqlLFH53xQLJlowrA0fQKcRRFfVn0lTbD+
         1mcw==
X-Forwarded-Encrypted: i=1; AL+hErHv63B8pTcGU5d2FDdk329dGF9FNe29lzv9JtyDHKLSzGhej/EPdw9jK5uvTOeFKb4G66sQ7nJHrW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J5FOwIby70y12KPByQqGawGVweddWEh9IAJNcxBOzRX/LVf+P
	y+NquveTpIU8SxosUN+knLTNiqZy98lyRc0M+3jWr04ao+ABxjnQTYXR2sn3pmlxuqU=
X-Gm-Gg: AZFdTZee8mp568JUa229fDKF8U5zTSyf1aUcrv4O+HlKvGG+UOzwKLqo3TGpexmnP2W
	w36vOn91d2bFk0Rrwt2FkTdKYPL6wNei+wlfQHzTUx8zEtYr2/gl78ecNNRIEUhrXy4f0cl86OT
	DBQ59io0WQX0S+5/ijH+eepJk7UdhwNdFq5VbjimdhnmvXa6cCLpZ4CNIC1q9KZhAHP8PJeUeTb
	9Cfya3tov8kSNHlCYGyxVTxj3Rme+y3G84n81h3Fq3zVKjmQHv2sVkAf5VvzOcCbk76ZLyjqucO
	W4wDdLiZU6lcuCpzPbm4RVZY8ItMK+Uk/35tvkaGXTo7KKdfi78BpqzF/3hkxFUlRNDuxuXqW/0
	JjJVlv/95L4O2QPDJF1/k3bPbiXhcDU6WUmPgmhd0/M5jqAZK45RBgc0kTeJCFw9em/H30GJWnV
	KQP2IXvsiJPJiyCB6P9PfVdBmTUnEBIAW03O9aeJKjg+bj3ioOuvTsl6xzEZEGrzer6wzgFYUY/
	4JJ2FF8J7vZ7PusFahZZl47Ja6EG1TL3DxD+f0UK85tIZ61za4dFbnRpU7b2FRrzUTKzowVI/zO
	8KYz9XO1Eql+mZ30tvyqoLEgc16744aTLH6hqVM2OHNf/jIIlQyadYImy3ZGaMd01IPagxBih5Z
	jnThsxtA=
X-Received: by 2002:a05:622a:8413:10b0:55d:8475:aafb with SMTP id d75a77b69052e-55d8475ad43mr113506371cf.71.1795442484804;
        Mon, 23 Nov 2026 06:01:24 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788074desm99999281cf.7.2026.11.23.06.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:01:24 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 01/60] nodemask: add node-state iterators
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Yury Norov <ynorov@nvidia.com>
Cc: gourry@gourry.net, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Oscar Salvador <osalvador@suse.de>, Johannes Weiner <hannes@cmpxchg.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Matthew Brost <matthew.brost@intel.com>, Byungchul Park <byungchul@sk.com>, 
 Alistair Popple <apopple@nvidia.com>, SJ Park <sj@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, Kees Cook <kees@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Michal Hocko <mhocko@kernel.org>, David Rientjes <rientjes@google.com>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Pedro Falcato <pfalcato@suse.de>, 
 Jann Horn <jannh@google.com>, Chris Li <chrisl@kernel.org>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
 Youngjun Park <youngjun.park@lge.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>, 
 Tejun Heo <tj@kernel.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org, 
 driver-core@lists.linux.dev, damon@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 cgroups@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org
In-Reply-To: <awMK9V6TbU9Xtzn9@yury>
References: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
 <20261120-private_nodes_v6-v1-1-74f5f9a115c2@gourry.net>
 <awMK9V6TbU9Xtzn9@yury>
Date: Mon, 23 Nov 2026 09:01:22 -0500
Message-Id: <179544248227.412063.16491857533875192357.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-22 10:32 -0500, Yury Norov wrote:
> On Fri, Nov 20, 2026 at 01:08:52PM -0500, Gregory Price via B4 Relay wrote:
> > From: "Gregory Price (Meta)" <gourry@gourry.net>
> > 
> > Add first_node_state() and next_node_state(), so callers can walk any
> > node state the way first_memory_node and next_memory_node walk N_MEMORY.
> > 
> > Add for_each_node_mask_state(), which iterates a nodemask intersected
> > with a node state using the bitmap intersection helpers, without a
> > temporary nodemask.
> > 
> > Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> > ---
> >  include/linux/nodemask.h | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
> > index 607373bd83ee..90bdcffa42ea 100644
> > --- a/include/linux/nodemask.h
> > +++ b/include/linux/nodemask.h
> > @@ -411,6 +411,11 @@ enum node_states {
> >  
> >  extern nodemask_t node_states[NR_NODE_STATES];
> >  
> > +/* Iterate the nodes in a mask that also belong to the specified state. */
> > +#define for_each_node_mask_state(node, mask, state)			\
> 
> for_each_node_state_and? We've got for_each_node(), and we've got
> for_each_node_state(), so let's figure out consistent naming.
> 
> Did you check the codebase for exsisting candidates for this helper?
> 

for_each_node_mask_and() would be more consistent, change just requires
passing node_state[N_MEMORY_X] instead of just the node state bit.

> > +	for_each_and_bit(node, nodes_addr(mask),			\
> > +			 nodes_addr(node_states[state]), MAX_NUMNODES)
> > +
> 
> Please use nr_node_ids instead of MAX_NUMNODES.
> 

I followed for_each_node_mask() which uses MAX_NUMANODES but let me
look.

> >  #if MAX_NUMNODES > 1
> >  static __always_inline int node_state(int node, enum node_states state)
> >  {
> > @@ -435,6 +440,12 @@ static __always_inline int num_node_state(enum node_states state)
> >  #define for_each_node_state(__node, __state) \
> >  	for_each_node_mask((__node), node_states[__state])
> >  
> > +#define first_node_state(state)	first_node(node_states[state])
> > +static __always_inline unsigned int next_node_state(int nid, enum node_states state)
> > +{
> > +	return next_node(nid, node_states[state]);
> > +}
> 
> At least the following {first,next}_{online,memory}_node must be
> switched to the new helpers. Can you check through the rest of the
> kernel to make sure all candidates of the proposed helpers are
> converted?
> 

I originally intended to delete first/next_memory_node, to make
usage of N_MEMORY a bit more obviously, but dropped it to save an
extra patch or two.  I will probably add that back in.

But yeah i can update these otherwise.

-- 
~Gregory

