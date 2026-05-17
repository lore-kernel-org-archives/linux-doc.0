Received: from outbound.pv.icloud.com (pv-2002i-snip4-11.eps.apple.com [57.103.64.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D5E2D8DA8
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779014236; cv=none; b=J/sgcbTLGsXdmLUgRA88ioizcPj7lhff5OsqknAtQEJw6y3j4PNETDLzIlmlQiqhKVtZZ2hudoBpSzKXm9FtQBaY1fz2ljwFmwik8/ZDSEa0JBvZ5P3WFdWZ0Phh1GJxH0IZNh8+lYhVuXMDg4c88sVn4dbnQkWv4UMpmS3UoxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779014236; c=relaxed/simple;
	bh=KQ+sqonD36ZnounCdX3fUggCgNmW/tiy1gJMNomu4qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NYy4pg2tkK+K/mNOQTSaY5h7aTA3wCeLB2ccx5HRwM3r8wi9bSmrChH6j20GmeweG9kiW7ARU/VYuYipwsRoDOO/kZEiUfTekqrxvbeEeBG8cvC9nEQGldtxJ8cT+4TG/Fo0pvUBv7WjSU58gfQhA7OVvrYKheptBJhleIxtUyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=RUnlqTKu; arc=none smtp.client-ip=57.103.64.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="RUnlqTKu"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-7 (Postfix) with ESMTPS id 4D3661800108;
	Sun, 17 May 2026 10:37:10 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhKBUMDRQBBCFYBWANLVxQEC0AFBlgARnkRUAFYHlZeWhdeTVEPDwNKEAJeBV1yGVoUXBhTRVEfVFhBDgpaB1BRHV8CCgRHBFsXRgNTRUIGFxFQAVgeVl5aF15NRx9ATWJJAVoZWxxAF0puTVMPDxlaFFwYU0VRH1RYXgRTVg5CCUoFXQJaBUEJSwVZB0UGRQ1MB0AGRkEDUUkAXwErWxNVF0YJGQhdHQdYRxRHDg8ZWhRcGFM=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1779014235; x=1781606235; bh=TeziDzDoO/PNY6PhjgVpHD9zZvjFwOl+yvI8NCHJLSI=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=RUnlqTKuoyFFJCvYHOHSWUPlBSiNo+PdekRUuFU1gS+BQWWfym4onKMVe1VTXC5S2h7dBdX8eKmljT6/UBI+wggh8UL9ruNLmAMb9LNKl6bTIbxxWKnvGdhWFRikmQ1sGu3v3ZspsRHGiBLKPKLrO2+4G+Ln+eY6KQZ9IcNhYI6XLVx7xnrz6cU7sxn+8q9uMittwxk78JEvvBYCgDFgUZlxsRZFCT1pqWXeVVVIooC2XPPTAMje8a1C7Nv+dfk6YRE0x/Q5+u3Un8IApjTGgxSJ5gjj/gBQvpNpCFJxO3M+wvZq97OiOVeNYdEOb6LIDFjugS/Up33+zlfziZizgg==
mail-alias-created-date: 1778972301885
Received: from localhost.localdomain (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-7 (Postfix) with ESMTPSA id EC5F818000B1;
	Sun, 17 May 2026 10:37:05 +0000 (UTC)
From: Sakurai Shun <ssh1326@icloud.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Sakurai Shun <ssh1326@icloud.com>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs/mm: fix typo in process_addrs.rst
Date: Sun, 17 May 2026 19:36:35 +0900
Message-ID: <20260517103640.45444-1-ssh1326@icloud.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDExMyBTYWx0ZWRfX1AAOIyg7xFDP
 jquP21Q4lLX+zcFlWp4i4CME/d8SNLi9DZaqYnDsUAhWbrPWry5Z4QiI9OSXVdW773Kjiq7UeEs
 y3l69quiFKhdPX/t2mVasNijPk9eD/lurYmxSqFCtHsPAi1ujU4nu3MAIP9vrXgW8+nHh4nVQm1
 FgxaSUCW57IY0Q/yhzHRIxjYIPcfeHuYs+5DIabXgnYQFNlmhctojdH5L2k9oJVbO7RL+n0bbpI
 p8q1c4Z3UvMkeXMWFYLX8tak2z5tfFgCx8PvJxJW719IBJEEWBRQ2VvTChcHZ4h6qugsIuPmuBT
 ++iJVH2Po1t/Ncni6CL/hTuS1e5FI45CmF771HWSHP5c5Y5cumAVlQoYaRSsoQ=
X-Authority-Info-Out: v=2.4 cv=N78k1m9B c=1 sm=1 tr=0 ts=6a099a58
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=NGcC8JguVDcA:10 a=x7bEGLp0ZPQA:10
 a=ZxuoajvSgW0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=lqo7fT-aTzeglYgoLxgA:9 a=IxSG75etxsVYPPdR13TJ:22 a=YETpcmI30o-OGwpgB0-d:22
X-Proofpoint-ORIG-GUID: AdqbNU45CklcMOGHau956gW3IQpfYlIY
X-Proofpoint-GUID: AdqbNU45CklcMOGHau956gW3IQpfYlIY
X-Apple-Category-Label: MjE0Nzk4NjU5NzY6JGNhdGVnb3J5JF9QZXJzb25hbCw=

Replace "presense" with "presence"

Signed-off-by: Sakurai Shun <ssh1326@icloud.com>
---
 Documentation/mm/process_addrs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
index 851680ead..042d64d72 100644
--- a/Documentation/mm/process_addrs.rst
+++ b/Documentation/mm/process_addrs.rst
@@ -775,7 +775,7 @@ lock, releasing or downgrading the mmap write lock also releases the VMA write
 lock so there is no :c:func:`!vma_end_write` function.
 
 Note that when write-locking a VMA lock, the :c:member:`!vma.vm_refcnt` is temporarily
-modified so that readers can detect the presense of a writer. The reference counter is
+modified so that readers can detect the presence of a writer. The reference counter is
 restored once the vma sequence number used for serialisation is updated.
 
 This ensures the semantics we require - VMA write locks provide exclusive write
-- 
2.54.0

