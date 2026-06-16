Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01D936403D;
	Tue, 16 Jun 2026 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619294; cv=none; b=pWifPK106i8VscMFSBBhKUHoZ+CA1ONdBrKkX/4mxXxHxC+Q+ernvYTwmu59YkdpwgC4pHWZgyxIHhqjeSE+r4G9F66r/Ni+v2Dmiy52oaiftamEhjHXEDwmpa38x2PdPJvJPfMVhqjGuDpJUdTaGiWJc/MVttKn+u+vJRVqu9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619294; c=relaxed/simple;
	bh=rAxGQz0JOO8vdB5NtKRpIZ3BB/8GwOhQXU7tPhNgZjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=msxGxEXhU+p7K1W+zB3Tq2dFKH0Fvda9g5ZjyDk/cG2UhJiwREtOVf7skHoTBe+LCqZnkagH0pI9mpzjFtU2iyK23LBszdnfOIS2Sh8odr+ACMjlld6cewccTCzwu8zvU7UUziR6UbF/HHbfypH+YOs1csrL38mU0vuwBQFuUz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowABHZNtDWjFq5sHvFA--.10727S2;
	Tue, 16 Jun 2026 22:14:28 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Harry Yoo <harry@kernel.org>,
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
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH 0/4] mm/slub: preserve previous object lifetime
Date: Tue, 16 Jun 2026 22:14:06 +0800
Message-ID: <20260616141410.52117-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABHZNtDWjFq5sHvFA--.10727S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyxCw17XryfCFyUJrWUurg_yoW8WF1xpr
	WfKws3tasFqryxCwn3Cr12gr93uayrG397JFsrKw40vrs8G3W0yF4xKrn0qFy7AF9rZ3Wa
	vrWFv3W3Gr1qy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7sRE2Q6tUUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

SLAB_STORE_USER currently stores one allocation track and one free track
for an object.  Once the object is reused, the next allocation overwrites
the allocation track.  If a stale pointer from the previous lifetime is
later freed or otherwise reported, the report can show the victim
allocation and the stale operation while the previous completed lifetime
has already been lost.

This series keeps one previous completed lifetime in the existing
SLAB_STORE_USER metadata and prints it when available.  It is intended as
diagnostic information for reuse cases only; it does not infer semantic
ownership or identify the root cause of a use-after-free.

This is the non-RFC version of the earlier RFC.  Based on the feedback,
this version does not add a separate slab_debug=H option.  If a user
enables U, the user tracking metadata records the current allocation/free
tracks and one previous completed allocation/free pair.

Changes since RFC:
- extend the existing U option directly instead of adding H/UH
- add KUnit coverage for the previous-lifetime state transition
- document the extra report lines and the diagnostic-only semantics

Pengpeng Hou (4):
  mm/slub: factor user tracking metadata size calculation
  mm/slub: preserve previous object lifetime in user tracking
  mm/slub: test previous lifetime tracking
  Documentation/mm: document SLUB previous lifetime tracking

 Documentation/admin-guide/mm/slab.rst |  12 ++-
 lib/tests/slub_kunit.c                |  33 +++++++++
 mm/slab.h                             |  10 +++
 mm/slub.c                             | 102 +++++++++++++++++++++-----
 4 files changed, 136 insertions(+), 21 deletions(-)

-- 
2.43.0

