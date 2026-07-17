Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320FD245012;
	Fri, 17 Jul 2026 16:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784305710; cv=none; b=BFUiEFg1104iRe/aiCgtUiWNAm92R+AIKmwZV0rOzoc+Yq/+rBfCq5ga1Z0TPBe9zy9/N2Q0wy753khKqr0beGBQMCYsGJmKrKFCx5SXX4UKsLeDRwbjf76BiDHcEdWoDyYVcljNfh++spwKBgA4vRAK2SlFCbJhE61IIyGj1LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784305710; c=relaxed/simple;
	bh=Ui7aYrJEtAdVXvzRZG2QYGHV7hqf0HhNLMDaqO3+XoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8Kex/rzHiR6XUELY/GNjxleyJxfjKu46HiKij7cl/Rv+VGVaVUVlGZ/qAwtOm6LX2Zb7yI1WGvjOCBtb32josB1JGoIpXEzm/x+PeIwvK9IU3Pr4AvZesC2wf5SKI854MkZwrNhNxeA8fEF4FIogXfkF03Cd1FIGwekhvkxAxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jTHe1qxw; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jTHe1qxw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=i4DEbOkf4Nlnm4ttg+oJUXqZuE2jbuo/tlclUK4guCs=; b=jTHe1qxwT+fLkTvtdmp08Jijzb
	qKHY1ZArCAQFZkwLpleQpASof22kCinyi1OsZYR2WIAE5tSPvXXEpAofT1p3XIFesUfaZz/tDwlDl
	zK0yykvSb3lGHrCEmpKEU1rlh+rQUsdFoRPzCa3PIAh6BqDbEwJtttlTtAJ7sBwyyYztLV9B0BGhh
	Pu/lM+aNR+awrRdeoxiB3/krYZwRXNX1SbewgRkFKuYacVvZGYfOE+3lqlfP/8rp2ICFbMwJEIYCl
	HAX8axvJU682LqPaNoRWYLiSUfSURGITqNZxQev71YT2IKH4oy/0GRGvDvNipga8/OUfcV8GWNkqn
	IQ9KNp0Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklQJ-00000002jrp-20m4;
	Fri, 17 Jul 2026 16:28:27 +0000
Message-ID: <45e7b19d-e30c-40a9-9c78-ed5dc690b761@infradead.org>
Date: Fri, 17 Jul 2026 09:28:26 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] scripts/kernel-doc: Suggest possible names for excess
 descriptions
To: Ryszard Knop <ryszard.knop@intel.com>, linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuicheng Lin
 <shuicheng.lin@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
References: <20260714111208.323108-1-ryszard.knop@intel.com>
 <20260717125753.634550-1-ryszard.knop@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260717125753.634550-1-ryszard.knop@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/17/26 5:57 AM, Ryszard Knop wrote:
> Recent check_sections() change added a warning if a documentation tag
> member name does not match the detected struct/union member names. Since
> the checker knows all possible names, we can suggest known names, so
> that it's more obvious how to deal with the warning.
> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> Changes in v1:
> - Added the suggestion hint in the warning, with basic name substring checks
> - Link: https://lore.kernel.org/linux-doc/20260714111208.323108-1-ryszard.knop@intel.com/
> 
> Changes in v2:
> - Strip trailing whitespace from the warning when the generated hint is empty
> - Link: https://lore.kernel.org/linux-doc/20260715111726.394565-1-ryszard.knop@intel.com/
> 
> v3:
> - Use difflib to generate suggestions even if the tag member is mistyped
> - Suggest names based on the nested struct members too
> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 51 ++++++++++++++++++++++++++--
>  1 file changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index 2dedda215c22..884f42584667 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -11,6 +11,7 @@ and extract embedded documentation comments from it.
>  
>  import sys
>  import re
> +import difflib
>  from pprint import pformat
>  
>  from kdoc.c_lex import CTokenizer, tokenizer_set_log
> @@ -558,6 +559,50 @@ class KernelDoc:
>                          self.push_parameter(ln, decl_type, param, dtype,
>                                              arg, declaration_name)
>  
> +    def get_suggestions_hint(self, decl_name, possible_names):
> +        # For decl name 'flags' or 'flgas', suggests 'substruct.flags'
> +        submember_exact = []
> +        submember_substrings = []
> +        submember_suggestions = []
> +        for possible_name in possible_names:
> +            parts = possible_name.strip().split('.')
> +            if len(parts) < 2:
> +                continue
> +
> +            final_part = parts[-1]
> +            if decl_name == final_part:
> +                submember_exact.append(possible_name)
> +            elif decl_name in final_part:
> +                submember_substrings.append(possible_name)
> +            elif difflib.get_close_matches(decl_name, [final_part]):
> +                submember_suggestions.append(possible_name)
> +
> +        # For decl name 'flgas', suggests 'flags'
> +        full_suggestions = difflib.get_close_matches(decl_name, possible_names)
> +
> +        # For decl name 'member', suggests 'longer_member'
> +        full_substrings = [name for name in possible_names if decl_name in name]
> +
> +        ordered_lists = [
> +            submember_exact,
> +            submember_substrings,
> +            submember_suggestions,
> +            full_suggestions,
> +            full_substrings,
> +        ]
> +
> +        # Deduplicate but maintain order from most to least likely:
> +        unique_suggestions = {}
> +        for suggestion_list in ordered_lists:
> +            for suggestion in suggestion_list:
> +                unique_suggestions[suggestion] = None
> +
> +        suggestions = list(unique_suggestions.keys())
> +        if not suggestions:
> +            return ""
> +
> +        return f"(did you mean one of: '{"', '".join(suggestions)}')"
> +
>      def check_sections(self, ln, decl_name, decl_type):
>          """
>          Check for errors inside sections, emitting warnings if not found
> @@ -566,12 +611,13 @@ class KernelDoc:
>          for section in self.entry.sections:
>              if section not in self.entry.parameterlist and \
>                 not known_sections.search(section):
> +                hint = self.get_suggestions_hint(section, self.entry.parameterlist)
>                  if decl_type == 'function':
>                      dname = f"{decl_type} parameter"
>                  else:
>                      dname = f"{decl_type} member"
>                  self.emit_msg(ln,
> -                              f"Excess {dname} '{section}' description in '{decl_name}'")
> +                              f"Excess {dname} '{section}' description in '{decl_name}' {hint}".strip())
>  
>          #
>          # Check that documented parameter names (from doc comments, including
> @@ -591,12 +637,13 @@ class KernelDoc:
>              if param_name in self.entry.parameterlist:
>                  continue
>  
> +            hint = self.get_suggestions_hint(param_name, self.entry.parameterlist)
>              if decl_type == 'function':
>                  dname = f"{decl_type} parameter"
>              else:
>                  dname = f"{decl_type} member"
>              self.emit_msg(ln,
> -                          f"Excess {dname} '{param_name}' description in '{decl_name}'")
> +                          f"Excess {dname} '{param_name}' description in '{decl_name}' {hint}".strip())
>  
>      def check_return_section(self, ln, declaration_name, return_type):
>          """

-- 
~Randy
