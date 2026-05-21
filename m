Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823C72BE655;
	Thu, 21 May 2026 01:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325215; cv=none; b=Iy20Fs0GVbiWWVlv0S/ZlAHOtxCi6VMcH87iwYEYVyasLJ3dw6++HClx4HB12wy+fwl710563BdqnajZ8odx+wEXZoJF24VUt58AcHR1RFpPpRGa3cuxW+64mwQp0gQl5+o//Do9P9N+fwJGclGUT0ovAMUjaySxF493jKQORas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325215; c=relaxed/simple;
	bh=gksflQGBDMG64sxM2GlUA3+Qr+XBTL+DueSxZZYZslE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cR9wrI5w7MpRYtRJqhPRqd+ghg/8u3SLHetZ6Er2RwgXc7xFGEWhKcCSjfuIhppqkDzakOfRzEIffpxML3w70vR1umYxCg3p3ohQTBuD7OGFz+UspaKRMlcNfutVBjSRznfQCBMBoCxC7r7DGUGvmOostlOFgvyyaBUP0NbFCIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=En9W2FUt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="En9W2FUt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF9A1F000E9;
	Thu, 21 May 2026 01:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779325214;
	bh=EyJB24P7MU0lOh7/s8c6PKCLDxcR2TJ5gd1Ela/Ygc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=En9W2FUtcOoELe4Hhg+oCHOdLJTrliDx8iiDJcrZ1nXiPTyVZW3laDOv1US2KP1Qh
	 Ri0jIKsiTEEHyRd2pd1753kEKbY9KXUa9uMOq5pzd0K0ZxKtHOoafoPo8zfsj40IDM
	 gcvaHvz1/F3vsa4TLxGj71dtG8K5YUI6dRO/vLZDVDF9Lm8VRbtUsbNU/ncRR5i3BB
	 YHIFtAMTbTa8imvgjDIKhOyUEP/X5SQU9nw3rz186AJ+PKx3yXgpPPRElk4i2e5DgI
	 pyN5RRNx0PNMS1yylTbaJ2V9yMj8l9kPces4knB7WlHqUF+xXf5DBk99GGxV4PFpAS
	 wv7ePst3psntg==
From: SeongJae Park <sj@kernel.org>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: SeongJae Park <sj@kernel.org>,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mm-new] Documentation/admin-guide/mm: Fix typos in transhuge.rst
Date: Wed, 20 May 2026 18:00:09 -0700
Message-ID: <20260521010010.84958-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520051751.74396-1-leon.hwang@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 20 May 2026 13:17:51 +0800 Leon Hwang <leon.hwang@linux.dev> wrote:

> Fix these two typos:
> 
> 1. approporiately -> appropriately
> 2. presure -> pressure
> 
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
