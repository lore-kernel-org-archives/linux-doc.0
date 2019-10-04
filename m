Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 41B077D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Oct 2019 10:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387689AbfJDKh0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Oct 2019 06:37:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:47614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbfJDKh0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Oct 2019 06:37:26 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D9D6B215EA;
        Fri,  4 Oct 2019 10:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570185446;
        bh=iBQF2+NS3IUMK5BhUwN9rX2yg8DwSDs2+jK+wIGNkkE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ign7A6WyVcqgWtlm8J4o3Lamf2+hcDBoVklGntADdUH0ePlfnG02YAsHEfXfTsOwz
         Wo8n+BSt9/5agQ6bgT/JE2am3QYMnfMsmztBqBCxOWFiohmgPvIDtBcX/2D3jAfiX2
         nnQATchgEYXKtKxYaP1aztOMER2qfHnYKK9OFAoY=
Date:   Fri, 4 Oct 2019 11:37:22 +0100
From:   Will Deacon <will@kernel.org>
To:     Julien Grall <julien.grall@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, suzuki.poulose@arm.com,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/4] arm64/cpufeature: Fix + doc update
Message-ID: <20191004103721.tnjii772ts72pnm5@willie-the-truck>
References: <20191003111211.483-1-julien.grall@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003111211.483-1-julien.grall@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 03, 2019 at 12:12:07PM +0100, Julien Grall wrote:
> This patch fix an issue related to exposing the FRINT capability to
> userspace (see patch #1). The rest is documentation update.
>
For patches 2-4:

Acked-by: Will Deacon <will@kernel.org>

Catalin can take them for 5.5, since I don't think they're urgent.

Will
