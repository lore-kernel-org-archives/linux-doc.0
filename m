Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161A63AB285;
	Mon, 15 Jun 2026 06:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503966; cv=none; b=AgoR5GLxwdLNqWjn9O0xxv0XFg0UV3rval1Qe7oVS67VEIGKDZuP4urwyTVm+sMr3UToEitADXXHzEeYmEn1Bl9fmdn9+nhM1UlWxC9i+vB59dtcTPJ6X3sJ09gwCKv4QB7Fz1WLDRunbOuwFYiZs8c9Tn3zBBWNYgB5mRXejCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503966; c=relaxed/simple;
	bh=sCTDUmii5lLQQcKt1l0AcYHEaoTOiEeDl/wS7+ETL2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kKrGhbFrFUE2RBwKilA7BSAK/R8MRSdWbegSv3yYHcNB6UdY1rYYbeFFa/NHM2JBrMQr/0RMBeNGi56kCz/LtxUQWoiQpxUW1mcd4bPZBoNraWOzzTwraT8ChuLVkEC4m/UL3BA92FIfbudHBlh6aDid1ntT4reK3oTqj9Vp9ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABnvhG9ly9qUNiSEw--.62981S2;
	Mon, 15 Jun 2026 14:12:13 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Harry Yoo <harry@kernel.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	liam@infradead.org,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] mm/slub: preserve previous object lifetime
Date: Mon, 15 Jun 2026 14:12:02 +0800
Message-ID: <20260615061202.23715-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <763e61e9-9270-4057-938f-daf9184a41ae@kernel.org>
References: <20260611063926.38111-1-pengpeng@iscas.ac.cn> <55b1b674-6487-4585-8a0d-919373e66d3a@kernel.org> <763e61e9-9270-4057-938f-daf9184a41ae@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABnvhG9ly9qUNiSEw--.62981S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Wry7Ww4kXw4DZF1fJr4kCrg_yoW8JFWfp3
	yrGw4rJ3ZFqF9rCa4DA3WxJ3409rWrWF1DG3s0grW29a1Yg3WxArWfKF1Yqa4UCrZ2y3Wq
	vr1jgwsxJws5AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0pRiSdgUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Hi Vlastimil, Harry,

Thanks for the feedback.

I agree that the terminology in the RFC cover letter was not precise
enough. The case I was trying to describe is a duplicate/stale free by a
previous owner after the object has already been freed and then reused by
another user. In that case, the current SLAB_STORE_USER records can show
the current allocation and the later bad free/check, but the previous
completed alloc/free lifetime that explains where the stale pointer came
from has already been overwritten.

This is not intended to compete with KASAN or infer semantic ownership.
KASAN is better when it can be used, but the motivation here is the lower
barrier of enabling slub_debug for a specific cache on an existing kernel,
especially in field debugging environments.

Based on your comments, I will rework the non-RFC version to fold this
into the existing U tracking instead of adding a separate H option, unless
there is a preference for keeping the extra history behind an explicit
flag. I will keep the scope to one previous completed lifetime and avoid a
larger history table/ring for now.

I will also add a small reproducer or KUnit coverage showing the lost
previous-lifetime case, plus object-size/order comparison data for a few
representative caches.

Thanks,
Pengpeng

