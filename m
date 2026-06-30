Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226FE8462;
	Tue, 30 Jun 2026 00:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782777991; cv=none; b=cIblhBuFkhhu/fN2KvrfXBv15cdDIsMsTKCjlJkrrR0nLP+M4a7QzOYh+d1yJO40H2udQ2IwmGlipP1GFq21kvT98nm5U5Jq+zu4PDEjTr9ZrSoYi6KcTzc3js3kr1bmCWQsmB31AnodjPT20VTjo7mCz/XTMLgunTeRuIcdLVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782777991; c=relaxed/simple;
	bh=Hb+5u2O0NYDZMN2nffXTZRsmC0oPWxRQB3QuCRK+RAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L3SVPIFRrgxNFqAgbxj5joM5FKMsWuU8YgAY7AsemP1Vgcs1nuQ/D5WLgEfT8T+7WiVqg12MuAykxl+7Vb+xVZUl2SII4KwOyFUc+12oc/xvRE7viZf+VFJ9VqdX0fhpphjrUL5L4tWA+lvckbDphGH9WphDdDlKFk4e3vsyoVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=op2Qz5sb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="op2Qz5sb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C9B1F000E9;
	Tue, 30 Jun 2026 00:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782777989;
	bh=wr0WhPYUR8JNxrzJzf7gHN9+IIk9NqnlvxkjdbY2WYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=op2Qz5sbAMoEgRjtESmf7VxN/alp731dgehGyYqOvxX+SYlu1zrmDu2m/ooESPLri
	 COenaZehUI35c1792BoWfzxnx+LUfL6xhUwhOVcysVA/mUB8lKUpU1cAvNI3p+To+o
	 VhO7dgNpFBGNfZ//6nYSXVqIPT9hRxSUUr8jPbc4gSnix35irf08d8ABfrEv9m83CM
	 qYv76/ZbvUb2FUqINLXl1RKUlnGeqeCkQUBTYcBIRNT7R0umdybdRfZl1VxAp7Q5PP
	 lYf/uoR0R0EMGcWFFQi7qg7AZFsB07Q+eElv7l5wnaiIzLqQE//rYuZmmX5nkQa7b2
	 MrakI1V26OeMQ==
From: SJ Park <sj@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: SJ Park <sj@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/mm: Fix braces
Date: Mon, 29 Jun 2026 17:06:19 -0700
Message-ID: <20260630000620.138992-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260629161156.90213-2-manuelebner@mailbox.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 29 Jun 2026 18:11:56 +0200 Manuel Ebner <manuelebner@mailbox.org> wrote:

> Correct typos in mm documentation by balancing parentheses.

Good eyes!

> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
