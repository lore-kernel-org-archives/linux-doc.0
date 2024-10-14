Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D508236B
	for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 06:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728888331; cv=none; b=fRuzxiUEVvoCNn1JaaWY0OLRT4omPf9r5hSDAfbIxq2202m22b8Cdr4y80gSvZF6r7NWLla+BhCiUDhqXexwVPCO6lctF+pmL94JI8dK+fRiAlm9ZmrMWJYy2E0desuXCa9vinqnmlHBw1Xca6ILte2scLdDRdYX7X+cciDJEMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728888331; c=relaxed/simple;
	bh=QHznhC8qVhqdpFTp+98K6Rqio2u7txt/81flO63mqzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=THWpcRauHD+zE8BMufXRipmJA3uKyymOzoJlyJ4VIfJ85hwx31iEVOq7DgEeSx79Ftu/p3LXTgSS7e/fIn8tgrc/lIpSLx+W4k5FO9kNebt7K/LUReRY3JeCQHr93Og1utrc4vExN5m18NUYZsYzN6Jq+W7sAtXpzOtim7p3l/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=lxD3YQoY; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=oOylQH1D; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=IjzWDmOZ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=qOYb8aIW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="lxD3YQoY";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="oOylQH1D";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="IjzWDmOZ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="qOYb8aIW"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D8827220BC;
	Mon, 14 Oct 2024 06:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1728888327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rJa1t/BVvus2nOFuy4o7n2mSfo4hiHwlNcuzGeaBad0=;
	b=lxD3YQoYFnDdhFY0pfHXmTO8JAE0ZOEyayV7lWGXMc/ZxeuCkCQd4lXoXBTXvt7EfPBET6
	ZecEJQmgLq/s7fZwhr/MyeNgu3MAiGgeujdVYtrB4dgJm0FARw5cfxuM/MrS7lx3o6N6kL
	Ux5Rcsq3EEz2ai9lTWA0hU1WHGwxDWI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1728888327;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rJa1t/BVvus2nOFuy4o7n2mSfo4hiHwlNcuzGeaBad0=;
	b=oOylQH1DAhrjHBE1gwrUmsj0hURgJWjr0A3q7SCXX1PHbiBu44biMYlJzqjT2cWX+yY5Cc
	iXaembsAlgtUjJCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1728888326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rJa1t/BVvus2nOFuy4o7n2mSfo4hiHwlNcuzGeaBad0=;
	b=IjzWDmOZ19EbYWL2K99wjLSiVzAyFLPFjH76bqxiHn8bafAjszvCEsmKzOy+6wgKNywyPp
	Si6PQdvXHQ9NWNYanLxbYwy3Ll66jhr/lh1IoOhpr2H5Ci7A7vHksdZIvqqrtEbkV5cWwE
	J/Q2rnEXjm8kdDfnTUAxrpe5zmJK2iM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1728888326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rJa1t/BVvus2nOFuy4o7n2mSfo4hiHwlNcuzGeaBad0=;
	b=qOYb8aIWjoWNCna9CXRXWXuVRJOTzo+DEDxDrAAPtUKkUpKhE0xLf3vet8RV07SBh/825y
	VrZAnrspdpx4+bCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9F5413A42;
	Mon, 14 Oct 2024 06:45:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id snndMAa+DGfZUAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 14 Oct 2024 06:45:26 +0000
Message-ID: <c4c6b323-f541-4696-890b-2a852b761b39@suse.cz>
Date: Mon, 14 Oct 2024 08:45:25 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] kernel-doc: allow object-like macros in ReST output
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Horia Geanta <horia.geanta@freescale.com>,
 Jonathan Corbet <corbet@lwn.net>
References: <20241014051333.462847-1-rdunlap@infradead.org>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <20241014051333.462847-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 10/14/24 07:13, Randy Dunlap wrote:
> output_function_rst() does not handle object-like macros. It presents
> a trailing "()" while output_function_man() handles these macros
> correctly.

Thanks!

> Update output_function_rst() to handle object-like macros.
> Don't show the "Parameters" heading if there are no parameters.
> 
> For output_function_man(), do show the "ARGUMENTS" heading if there
> are no parameters.
> 
> I have tested this quite a bit with my ad hoc test files for both ReST
> and man format outputs. The generated output looks good.
> 
> However, I am seeing one problem that I don't have any idea about and
> would appreciate some assistance, even just email commentary about it.
> The output now includes around 100 warnings like these examples:
> 
> Documentation/core-api/mm-api:37: ../include/linux/slab.h:154: WARNING: Inline literal start-string without end-string. [docutils]
> Documentation/core-api/mm-api:37: ../include/linux/slab.h:192: WARNING: Inline literal start-string without end-string. [docutils]

To clarify, I assume this part only happens with my patch that motivated this?
https://lore.kernel.org/all/20241009142936.56092-2-vbabka@suse.cz/

Also can you clarify whether these docs should look like:

  /**
   * define DRM_GEM_VRAM_PLANE_HELPER_FUNCS - \

per Documentation/doc-guide/kernel-doc.rst

or

/**
 * DRM_GEM_VRAM_PLANE_HELPER_FUNCS - Initializes struct drm_plane_helper_funcs
 *                                   for VRAM handling

as it is in the actual file include/drm/drm_gem_vram_helper.h
i.e. if that "define" keyword is needed, or it doesn't matter?

Thanks,
Vlastimil
 
> and
> Documentation/driver-api/device-io.rst:: ERROR: Anonymous hyperlink mismatch: 16 references but 0 targets.
> See "backrefs" attribute for IDs. [docutils]
> 
> Does this mean that I am now generated some garbage and feeding it to
> docutils?
> 
> Fixes: cbb4d3e6510b ("scripts/kernel-doc: handle object-like macros")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Horia Geanta <horia.geanta@freescale.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> ---
> Cc: linux-doc@vger.kernel.org
> 
>  scripts/kernel-doc |   35 ++++++++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 11 deletions(-)
> 
> --- linux-next-20241009.orig/scripts/kernel-doc
> +++ linux-next-20241009/scripts/kernel-doc
> @@ -569,6 +569,8 @@ sub output_function_man(%) {
>      my %args = %{$_[0]};
>      my ($parameter, $section);
>      my $count;
> +    my $func_macro = $args{'func_macro'};
> +    my $paramcount = $#{$args{'parameterlist'}}; # treat -1 as 0
>  
>      print ".TH \"$args{'function'}\" 9 \"$args{'function'}\" \"$man_date\" \"Kernel Hacker's Manual\" LINUX\n";
>  
> @@ -600,7 +602,9 @@ sub output_function_man(%) {
>          $parenth = "";
>      }
>  
> -    print ".SH ARGUMENTS\n";
> +    if ($paramcount = $#{$args{'parameterlist'}} > 0) {
> +    	print ".SH ARGUMENTS\n";
> +	}
>      foreach $parameter (@{$args{'parameterlist'}}) {
>          my $parameter_name = $parameter;
>          $parameter_name =~ s/\[.*//;
> @@ -822,10 +826,13 @@ sub output_function_rst(%) {
>      my $oldprefix = $lineprefix;
>  
>      my $signature = "";
> -    if ($args{'functiontype'} ne "") {
> +    my $func_macro = $args{'func_macro'};
> +    my $paramcount = $#{$args{'parameterlist'}}; # treat -1 as 0
> +
> +	if ($func_macro) {
> +        $signature = $args{'function'} . " ";
> +	} else {
>          $signature = $args{'functiontype'} . " " . $args{'function'} . " (";
> -    } else {
> -        $signature = $args{'function'} . " (";
>      }
>  
>      my $count = 0;
> @@ -844,7 +851,9 @@ sub output_function_rst(%) {
>          }
>      }
>  
> -    $signature .= ")";
> +    if (!$func_macro) {
> +    	$signature .= ")";
> +    }
>  
>      if ($sphinx_major < 3) {
>          if ($args{'typedef'}) {
> @@ -890,7 +899,9 @@ sub output_function_rst(%) {
>      #
>      print ".. container:: kernelindent\n\n";
>      $lineprefix = "  ";
> -    print $lineprefix . "**Parameters**\n\n";
> +	if ($paramcount > 0) {
> +   		print $lineprefix . "**Parameters**\n\n";
> +    }
>      foreach $parameter (@{$args{'parameterlist'}}) {
>          my $parameter_name = $parameter;
>          $parameter_name =~ s/\[.*//;
> @@ -1704,7 +1715,7 @@ sub check_return_section {
>  sub dump_function($$) {
>      my $prototype = shift;
>      my $file = shift;
> -    my $noret = 0;
> +    my $func_macro = 0;
>  
>      print_lineno($new_start_line);
>  
> @@ -1769,7 +1780,7 @@ sub dump_function($$) {
>          # declaration_name and opening parenthesis (notice the \s+).
>          $return_type = $1;
>          $declaration_name = $2;
> -        $noret = 1;
> +        $func_macro = 1;
>      } elsif ($prototype =~ m/^()($name)\s*$prototype_end/ ||
>          $prototype =~ m/^($type1)\s+($name)\s*$prototype_end/ ||
>          $prototype =~ m/^($type2+)\s*($name)\s*$prototype_end/)  {
> @@ -1796,7 +1807,7 @@ sub dump_function($$) {
>      # of warnings goes sufficiently down, the check is only performed in
>      # -Wreturn mode.
>      # TODO: always perform the check.
> -    if ($Wreturn && !$noret) {
> +    if ($Wreturn && !$func_macro) {
>          check_return_section($file, $declaration_name, $return_type);
>      }
>  
> @@ -1814,7 +1825,8 @@ sub dump_function($$) {
>                              'parametertypes' => \%parametertypes,
>                              'sectionlist' => \@sectionlist,
>                              'sections' => \%sections,
> -                            'purpose' => $declaration_purpose
> +                            'purpose' => $declaration_purpose,
> +							'func_macro' => $func_macro
>                             });
>      } else {
>          output_declaration($declaration_name,
> @@ -1827,7 +1839,8 @@ sub dump_function($$) {
>                              'parametertypes' => \%parametertypes,
>                              'sectionlist' => \@sectionlist,
>                              'sections' => \%sections,
> -                            'purpose' => $declaration_purpose
> +                            'purpose' => $declaration_purpose,
> +							'func_macro' => $func_macro
>                             });
>      }
>  }

