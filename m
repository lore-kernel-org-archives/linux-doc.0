Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D3438D;
	Tue, 21 Apr 2026 00:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776729860; cv=none; b=tJ5b8FHzKhu6telbveQakZUBFYUc0fqjJsBE8dy3aBff0Y/Qr7cnewOvWkdX/094CfyrzN8yLZaq/mZnhdZB7o4sLI73VhP93CdokD+wCDA0VkpWC/uis3QKZ9rIthlMEu57n1jOyQ6SYeqi2g9hh/VYAL+NKoYCKbDB8xwX+j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776729860; c=relaxed/simple;
	bh=yWWpUlqoTvoUZbkXa4dm/1YNtAHQcPcL84yxHZN/7Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CW9NcfYk35DgOeAeY0M/FQ0CbwAqVydLsv2uYUd0jIPxjDQcbgOtOKs/TB9pdUsQlA45gTxiyJocxrIvxiM01qxZkak+RgrSycHLMPUIURsjf9qvFHyWqSq7P5QbOmyUY7H1Ue2w4neQw1Dgy2wm23unH3U+3gaf9cMaKh33wkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEefj2S4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEefj2S4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E924C19425;
	Tue, 21 Apr 2026 00:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776729860;
	bh=yWWpUlqoTvoUZbkXa4dm/1YNtAHQcPcL84yxHZN/7Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XEefj2S4A5GREyBXpMRQ8CsgwWruQhAfSzmH/00pgfdcyM96SY9MqmidnJ8TCPT9o
	 UWUrXMw6qyugDKWLdP/oOVRIx6gEQHHxHsR7GxsISy3PUJhSXEXsSV7ibczx7zZ773
	 iTxLp1gZY5yPanECPtEZjhgR+oclCugunBd/I/9hDvH3mNRJXj0JAEdR/j2cSLCMAH
	 mfWQM7fd3caSMQjfRHE+O2VO4x5UCyNKARQTb3ojHK1NH7G8CNPWVGpTLnTLnqQfr0
	 Yvy0jmhY/cgqsTroO2IpBPLwWTXhLtMGDQ9GtXMhsJCr8zjmwSN7FO8lXSDxEPlBQe
	 p4BFmREBwUvSQ==
Date: Tue, 21 Apr 2026 09:04:18 +0900
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: clarify that we are not looking for LLM
 generated content
Message-ID: <aea_AinEe-91iYHg@hyeyoo>
References: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>

On Mon, Apr 20, 2026 at 11:03:16PM +0200, David Hildenbrand (Arm) wrote:
> Let's make it clear that we are not looking for LLM generated content
> from contributors not familiar with the details of MM, as it shifts the
> real work onto reviewers.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Looks good to me,
Acked-by: Harry Yoo (Oracle) <harry@kernel.org>

Thanks for submitting this, David.

-- 
Cheers,
Harry / Hyeonggon
