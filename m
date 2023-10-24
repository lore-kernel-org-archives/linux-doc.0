Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D557E
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 00:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Greylist: delayed 670 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 23 Oct 2023 17:45:40 PDT
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF0549B
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 17:45:40 -0700 (PDT)
Received: from imladris.home.surriel.com ([10.0.13.28] helo=imladris.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1qv5MK-00026L-0V;
	Mon, 23 Oct 2023 20:33:24 -0400
Message-ID: <0915cf18732f9d0bf0907a6e8f14d2782e2b6bd7.camel@surriel.com>
Subject: Re: [PATCH] mm: hugetlb_vmemmap: fix reference to nonexistent file
From: Rik van Riel <riel@surriel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>, Mike Kravetz
 <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>, Andrew
 Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,  Mike Rapoport <rppt@linux.ibm.com>, Matthew
 Wilcox <willy@infradead.org>, Ira Weiny <ira.weiny@intel.com>,  Jonathan
 Corbet <corbet@lwn.net>, Wu XiangCheng <bobwxc@email.cn>
Date: Mon, 23 Oct 2023 20:33:23 -0400
In-Reply-To: <20231022185619.919397-1-vegard.nossum@oracle.com>
References: <20231022185619.919397-1-vegard.nossum@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: riel@surriel.com

On Sun, 2023-10-22 at 20:56 +0200, Vegard Nossum wrote:
> The directory this file is in was renamed but the reference didn't
> get updated. Fix it.
>=20
> Fixes: ee65728e103b ("docs: rename Documentation/vm to
> Documentation/mm")
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Wu XiangCheng <bobwxc@email.cn>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
>=20
Reviewed-by: Rik van Riel <riel@surriel.com>

--=20
All Rights Reversed.
