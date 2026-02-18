Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5795F2459E7
	for <linux-doc@vger.kernel.org>; Wed, 18 Feb 2026 07:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771398282; cv=none; b=hWQTAgfD0tySFOIvg5yx/Qf4iyyFTI1Otccxi9KNX0Y9MNHXAhGnt65IUVhFkrGYkRaOtHC1vmKBX+biNe0HRoW/b1cCRnbOGRTtnhubC/yqxCOsCBjxg6AT+tL3oGK6VhxzH3F478RGL45D24SuVO2xMncCKxZH09p/jMUONxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771398282; c=relaxed/simple;
	bh=yl0CWvHGlXpQlpf+O3ip/r4VgrSdwmftSINTwldI56s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rS4HWScKtqt05nlXCBtSxYPL04zWVmRJV6Zn30br682bwaMxtAg3xdZ0wkiV/53sQlMbPSin3wKV7a+N2h8yiyPL+6C/2u7gYRwcvzEWHAb8YkkTI/bjOwYi5bVX9hDU4bvy5agIuMTLdiprmwK5qXRMSnv0GO7ysF4M7JNHxuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJE0NvZS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJE0NvZS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B872AC19421;
	Wed, 18 Feb 2026 07:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771398281;
	bh=yl0CWvHGlXpQlpf+O3ip/r4VgrSdwmftSINTwldI56s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sJE0NvZSTo/qAlhFqUHAeXWAKmgJOjiaVr1W/61IhnmO+nHtxydTFqngguPVOKkSw
	 POWTDwXnoKDtDOqUPkLD55d5yGZ8+Nvv3YrKCwCXHSADOrVQHXefUeFJ+0V4pGb1A8
	 wDXFsc2EbnfW6WlCTygHmp9BEbXpAIlZubxDrBveKBQAF+t0j81U/pLjrRSR7ArsRQ
	 C7C6TM1Aas2dM8gYzBTYUR0sn3zks5KoD/s6GMzZRvhV9AdfOsXTxOx5DoljpbKkyA
	 WDZXWDZ9Unn6/rbwLdSq3fhboZNd2HI041+cllP5jJUKBxxI8wSxOLbMPvJlnIEJzA
	 lY9gDHZiHs7qg==
Date: Wed, 18 Feb 2026 08:04:37 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: kernel-doc for nested structs/unions
Message-ID: <20260218080437.4a86cb7d@foz.lan>
In-Reply-To: <1c1eb223-8fb6-464e-9d32-4abfd15afec3@infradead.org>
References: <1c1eb223-8fb6-464e-9d32-4abfd15afec3@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 15 Feb 2026 17:47:07 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> Hi,
>=20
> I have run into some confusing discrepancies (differences) in how
> kernel-doc handles some nested unions and structs.
>=20
> Examples:
> in include/linux/property.h, struct property_entry, there is this
> nested union:
>=20
> 	union {
> 		const void *pointer;
> 		union {
> 			u8 u8_data[sizeof(u64) / sizeof(u8)];
> 			u16 u16_data[sizeof(u64) / sizeof(u16)];
> 			u32 u32_data[sizeof(u64) / sizeof(u32)];
> 			u64 u64_data[sizeof(u64) / sizeof(u64)];
> 			const char *str[sizeof(u64) / sizeof(char *)];
> 		} value;
> 	};
>=20
> Running kernel-doc -none on this file reports:
>=20
> Warning: include/linux/property.h:406 struct member 'u8_data' not describ=
ed in 'property_entry'
> Warning: include/linux/property.h:406 struct member 'u16_data' not descri=
bed in 'property_entry'
> Warning: include/linux/property.h:406 struct member 'u32_data' not descri=
bed in 'property_entry'
> Warning: include/linux/property.h:406 struct member 'u64_data' not descri=
bed in 'property_entry'
> Warning: include/linux/property.h:406 struct member 'str' not described i=
n 'property_entry'
>=20
> If I follow the instructions in Documentation/doc-guide/kernel-doc.rst
> for using kernel-doc with nested structs/unions, I should add @value.u8_d=
ata
> etc. for these 5 missing kernel-doc entries.
> However, that still fails with the same warnings as above.
> Adding only @u8_data: etc. for these file struct members satisfies
> kernel-doc.
> Conclusion: don't use the nested union member name (contrary to
> the kernel-doc documentation).

On this specific example, it should have detected a non-anonymous=20
union inside it and replace u8_data with "value.u8_data". I added some
debug prints to it (see enclosed). Running it with a file with just the
problematic struct shows:

$ ./scripts/kernel-doc --yaml a.yaml --kdoc a.h
Info: members: const char *name; size_t length; bool is_inline; enum dev_pr=
op_type type; union { const void *pointer; union { u8 u8_data[sizeof(u64) /=
 sizeof(u8)]; u16 u16_data[sizeof(u64) / sizeof(u16)]; u32 u32_data[sizeof(=
u64) / sizeof(u32)]; u64 u64_data[sizeof(u64) / sizeof(u64)]; const char *s=
tr[sizeof(u64) / sizeof(char *)]; } value; };
s_id value
s_id=20
Info: members: const char *name; size_t length; bool is_inline; enum dev_pr=
op_type type; union ; const void pointer; union value; u8 u8_data[sizeof(va=
lue.u64) / sizeof(u8)]; u16 u16_data[sizeof(value.u64) / sizeof(u16)]; u32 =
u32_data[sizeof(value.u64) / sizeof(u32)]; u64 u64_data[sizeof(value.u64) /=
 sizeof(u64)]; const char *str[sizeof(value.u64) / sizeof(char *)]; ; ;=20

It seems that the problem is related with handling the anonymous union.
See, the logic inside kernel-doc to parse nested struct/union is probably
the most complex one inside kernel-doc.=20

> ~~~~~
> Now if we look at include/linux/soc/ti/knav_dma.h, there is a struct:
>=20
> struct knav_dma_cfg {
> 	enum dma_transfer_direction direction;
> 	union {
> 		struct knav_dma_tx_cfg	tx;
> 		struct knav_dma_rx_cfg	rx;
> 	} u;
> };
>=20
> Running kernel-doc -none reports:
> Warning: include/linux/soc/ti/knav_dma.h:127 struct member 'direction' no=
t described in 'knav_dma_cfg'
> Warning: include/linux/soc/ti/knav_dma.h:127 struct member 'u' not descri=
bed in 'knav_dma_cfg'
>=20
> After adding comments for @direction and @u, kernel-doc -none reports:
> no problems with this struct, where the struct kernel-doc looks like:
>=20
> /**
>  * struct knav_dma_cfg:	Pktdma channel configuration
>  * @direction:		DMA transfer information
>  * @u:			@tx or @rx configuration
>  * @tx:			Tx channel configuration
>  * @rx:			Rx flow configuration
>  */
>=20
> so kernel-doc is happy with @tx and @rx without having the union name pre=
pended.
> Well, this is again: Don't use the nested member union name.
> OTOH, if I do add the "u." to the @tx and @rx members,
> kernel-doc is still happy (no warnings here).

This is a bug, due to the lack of proper support for nested structs/unions.
If you add an extra print to members at the end of the rewrite function,
it handles the struct as if it were defined as:

	struct {
		const char *name;
		size_t length;
		bool is_inline;
		enum dev_prop_type type;
		union;
		const void pointer;
		union value;
		u8 u8_data[sizeof(value.u64) / sizeof(u8)];
		u16 u16_data[sizeof(value.u64) / sizeof(u16)];
		u32 u32_data[sizeof(value.u64) / sizeof(u32)];
		u64 u64_data[sizeof(value.u64) / sizeof(u64)];
		const char *str[sizeof(value.u64) / sizeof(char *)];
	}

e.g.:
	- the struct got flatten;
	- unions become named or unamed members, with no content;
	- the inner unions themselves (or struct) won't have any
	  members.

If we fix the bug, what we would see there would be:

	struct {
		const char *name;
		size_t length;
		bool is_inline;
		enum dev_prop_type type;
		union;
		const void pointer;
		union value;
		u8 value.u8_data[sizeof(value.u64) / sizeof(u8)];
		u16 value.u16_data[sizeof(value.u64) / sizeof(u16)];
		u32 value.u32_data[sizeof(value.u64) / sizeof(u32)];
		u64 value.u64_data[sizeof(value.u64) / sizeof(u64)];
		const char *str[sizeof(value.u64) / sizeof(char *)];
	}

Such conversion is ugly, but the logic was written with the concept
of:

	"If all you have is a hammer, everything looks like a nail"

So, basically, in the past there was a parser for normal structs that
works fine with non-nested struct and was already complex enough.
Avoid breaking the logic, the flatten logic was added on the top of it.

The rationale behind using a qualifier like "x.y" is that sometimes you
may have things like this:

	struct foo {
		struct {
			int size; /** Size of received data */
		} rx;
		struct {
			int size; /** Maximum TX size */
		} tx;
	};

Where "size" could either be rx.size or tx.size and they require
different descriptions. I'm pretty sure I picked some real
cases like that in the past.

When I migrated the code, I carefully tried to keep the same logic
on most of the code, being bug-compatible with the old version,
reducing the risk of regressions. So, this logic is the same as
we had on Perl.

-

The function which handles this is at:

    def rewrite_struct_members(self, members)
...
		    for s_id in rest.split(','):
...
			r =3D KernRe(r'^([^\(]+\(\*?\s*)([\w.]*)(\s*\).*)')
                        if r.match(arg):
                            dtype, name, extra =3D r.group(1), r.group(2), =
r.group(3)
                            # Pointer-to-function
                            if not s_id:
                                # Anonymous struct/union
                                newmember +=3D f"{dtype}{name}{extra}; "
                            else:
                                newmember +=3D f"{dtype}{s_id}.{name}{extra=
}; "
                        #


A "quick" fix would be to use a stack to push s_id, like:

	id_stack =3D []

and something to control when it is inside or outside the
loop, like

	level =3D 0
	old_level =3D 0

	<some loop that would increment/decrement level>

	if level > old_level:
		id_stack.append(s_id)		# Python "push"

	if level < old_level:
		id_stack.pop()

and, at the part that fills the name, use:

	ids =3D ".".join(id_stack)
        if not ids:
            newmember +=3D f"{r.group(1)} {name}; "
	else:
            newmember +=3D f"{r.group(1)} {s_id}.{name}; "

However, while looking into it, I guess it is time for us to part
away from the current approach, replacing it by a logic that works
better with nested structs, in a similar way to NestedMatch=20
implementation.

The problem with the current implementation is that it uses
lots of complex regex transformations to identify nested
patterns, on a way that it is not error-prone.

My proposal is to switch to a different logic that will
create (on this example) a list like this:

	member_names =3D [
		["name"],
		["length"],
		["is_inline"],
		["type"],
		["pointer"],
		["value", "u8_data"]
		["value", "u16_data"]
		["value", "u32_data"]
		["value", "u64_data"]
		["value", "str"]
	]

With that, cases like twe have duplicated names like here:

	struct {
		char *name;
		struct {
			u8 u8_data;
		} val_1;
		struct {
			u8 u8_data;
		} val_2;
	}

The member list will be:

	member_names =3D [
		["name"],
		["val_1", "u8_data"]
		["val_2", "u8_data"]
	]

By doing that, kernel-doc can accept both a "lazy" behavior
for the cases where "u8_data" is unique, while still accepting
the full name: "value.u8_data".

I have already a code to produce it, but I still need to bind it
to the dump struct logic. Once I have it there, I'll submit a patch
series.

>=20
> ~~~~~
> Looking at include/asm-generic/msi.h, kernel-doc reports:
>=20
> Warning: include/asm-generic/msi.h:31 struct member 'flags' not described=
 in 'msi_alloc_info'
>=20
> Easy to fix. Add that and kernel-doc is happy. Now we have:
>=20
> /**
>  * struct msi_alloc_info - Default structure for MSI interrupt allocation.
>  * @desc:	Pointer to msi descriptor
>  * @hwirq:	Associated hw interrupt number in the domain
>  * @flags:	Bits from MSI_ALLOC_FLAGS_...
>  * @scratchpad:	Storage for implementation specific scratch data
>  *
>  * Architectures can provide their own implementation by not including
>  * asm-generic/msi.h into their arch specific header file.
>  */
> typedef struct msi_alloc_info {
> 	struct msi_desc			*desc;
> 	irq_hw_number_t			hwirq;
> 	unsigned long			flags;
> 	union {
> 		unsigned long		ul;
> 		void			*ptr;
> 	} scratchpad[NUM_MSI_ALLOC_SCRATCHPAD_REGS];
> } msi_alloc_info_t;
>=20
>=20
> Two questions here:
> (1) Why are @ul and @ptr not causing kernel-doc warnings?

See above. Probably the code that flatten the union didn't work
fine (maybe due to "[").

> (1b) Should they be @scratchpad.ul and @scratchpad.ptr?

Yes, but once we implement a list like the one I proposed,
kernel-doc could support both ways.

> (2) Is the typedef confusing things here?

I don't think so: one of the first things the logic does is to get
rid of typedef.

>=20
> ~~~~~
> For include/soc/fsl/dpaa2-fd.h, kernel-doc reports:
> Warning: include/soc/fsl/dpaa2-fd.h:51 struct member 'simple' not describ=
ed in 'dpaa2_fd'
>=20
> Adding a @simple entry satisfies kernel-doc, but isn't kernel-doc required
> for @simple's struct member fields also?
>=20
> Well, feels like I am rambling. I thought that I had a case of
> the enclosing struct or union name being _required_, but so far all
> that I have shown is that it's not required (in these cases).

I'm pretty sure that trying to keep the current approach of
beating at the struct until it becomes flatten will always be
buggy. We need a logic that will just parse it, identifying
each level and produce a member representation without needing
to transform them into something else.

As a reference, I'm enclosing the patch I wrote to support
the new approach, together with an unit test for it. With the
structs inside it, the code is properly identifying the inner
structs/unions, when there  "private:" comments(*).

(*) There is currently a bug handling private - I have already a
    patch series addressing it.

Thanks,
Mauro

---


[PATCH] docs: kdoc: create a new logic to better handle struct/union members

The logic inside rewrite_struct_members() is messy and error
prune. As pointed by Randy Dunlap, parsing an struct like this,
for instance:

    struct property_entry {
        const char *name;
        size_t length;
        bool is_inline;
        enum dev_prop_type type;
        union {
            const void *pointer;
            union {
                u8 u8_data[sizeof(u64) / sizeof(u8)];
                u16 u16_data[sizeof(u64) / sizeof(u16)];
                u32 u32_data[sizeof(u64) / sizeof(u32)];
                u64 u64_data[sizeof(u64) / sizeof(u64)];
                const char *str[sizeof(u64) / sizeof(char *)];
            } value;
        };
    };

doesn't end well, as kernel-doc can't properly identify
that u8_data belongs to the "value" named union.

Write a new class using a similar pattern to what we did
for NestedMatch. Here, we opted to use a recursive approach,
as the code is simpler to understand.

This code itself is complex, so add together an unittest
to allow us to exercise it with more complex examples before
switching to it.

It should be noticed that we recently noticed a bug when parsing
a struct_group_tagged() logic that contained a /* private */.

We ended adding a small hack at NestedMatch, making it handle
unmatched blocks.

Here, the logic is more complex, and may have other problems
due to it. So, add a NOTE about it. We'll need to revisit
the parser before start using the new class.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/kdoc_=
re.py
index f67ebe86c458..6f56ab5cd5c3 100644
--- a/tools/lib/python/kdoc/kdoc_re.py
+++ b/tools/lib/python/kdoc/kdoc_re.py
@@ -402,3 +402,220 @@ class CFunction(NestedMatch):
     """
     def __init__(self, regex):
         self.regex =3D KernRe(r"\b" + regex + r"\s*\(")
+
+class MemberExtractor:
+    """
+    Extract members from structs and unions.
+
+    Parameters:
+
+    ``logger``
+      - a class derivated from logging logger used for debugging purposes.
+
+    NOTE:
+        This logic was written in a way that it stricly requires all
+        delimiters to be in place.
+
+        However, the current implementation at the parser for "private"
+        is **not** compliant: if one uses it, and doesn't add a public,
+        it will strip the delimiters.
+
+        We already added a hack at NestedMatch due to that, but let's not
+        repeat it here. Instead, we need to fix the logic at the KernelDoc
+        parser.
+
+        An alternative would be to not raise a ValueError, but it sounds
+        better to ensure that the kernel-doc is doing the right thing.
+    """
+
+    RE_STRUCT =3D KernRe(r'\b(?:struct|union)\b([^\{\};]+)')
+    RE_IDENT =3D  KernRe(r'\b([^\{\};]+)\b')
+    SPACE_CHARS =3D [ " ", "\t", "\n" ]
+
+    def __init__(self, logger):
+        self.log =3D logger
+
+    def get_code_block(self, text):
+        """
+        Return a C start/end code block, e.g. ``{ code_block }``.
+
+        Properly handle inner code blocks inside it.
+        """
+
+        start =3D text.find('{')
+        if start =3D=3D -1:
+            return None, None
+
+        stack =3D []
+        for i in range(start, len(text)):
+            char =3D text[i]
+
+            if char in DELIMITER_PAIRS:            # opening
+                stack.append(DELIMITER_PAIRS[char])
+            elif char in DELIMITER_PAIRS.values(): # closing
+                if not stack or char !=3D stack.pop():
+                    raise ValueError(f"missing closing brace at {i}")
+
+                if not stack:                    # all matched
+                    self.log.debug(f"code_block: {text[start:i + 1]}")
+                    return start, i
+
+        raise ValueError(f"missing closing brace at the end of the string")
+
+    def next_statement(self, s: str, pos: int) -> int:
+        """
+        Find the next statement inside struct/union, by searching for a ";"
+        delimiter outside a nested block.
+
+        Properly handle inner code blocks inside it.
+        """
+
+        stack =3D []
+        while pos < len(s):
+            char =3D s[pos]
+
+            if char in DELIMITER_PAIRS:
+                stack.append(DELIMITER_PAIRS[char])
+            elif char in DELIMITER_PAIRS.values():
+                if stack and char =3D=3D stack[-1]:
+                    stack.pop()
+
+            #
+            # Go up to the end of the statement
+            #
+            if char =3D=3D ';' and not stack:
+                return pos
+
+            pos +=3D 1
+
+        return len(s)
+
+    def isspace(self, char, ignore=3DNone):
+        """
+        Ancillary method to ignore space characters in C code
+        """
+
+        if char in self.SPACE_CHARS:
+            return True
+
+        return False
+
+    @staticmethod
+    def get_identifier(text):
+        #
+        # Remove bitfield/array/pointer info, getting the bare name.
+        #
+        text =3D KernRe(r'[:\[].*').sub('', text.strip())
+        if not text:
+            return None
+
+        s_id =3D text.split(' ')[-1]
+        s_id =3D KernRe(r'^\**(\S+)\s*').sub(r'\1 ', s_id)
+
+        return s_id.strip()
+
+    def extract_members(self, text: str) -> List[List[str]]:
+        """
+        Main routine to extract members from a struct or union.
+
+        It is called recursively until it finishes handling the entire
+        struct and their inner blocks.
+        """
+
+        members =3D []
+
+        self.log.debug(f"extract members from '{text}'")
+
+        pos =3D 0
+        while pos < len(text):
+            while self.isspace(text[pos]):
+                pos +=3D 1
+                if pos >=3D len(text):
+                    break
+
+            #
+            # find the next statement
+            #
+            old_pos =3D pos
+            pos =3D self.next_statement(text, old_pos)
+            member_str =3D text[old_pos:pos]
+
+            #
+            # drop semicolons after statements
+            #
+            while pos < len(text) and text[pos] =3D=3D ';':
+                pos +=3D 1
+
+            #
+            # Get an inner block, if any
+            #
+            nested_start, nested_end =3D self.get_code_block(member_str)
+
+            #
+            # No inner code blocks
+            #
+            if not nested_end:
+                if member_str:
+                    s_id =3D self.get_identifier(member_str)
+                    self.log.debug(f"member: {s_id}")
+
+                    members.append([s_id])
+
+                continue
+
+            #
+            # Handle members of inner code blocks
+            #
+            nested_body =3D member_str[nested_start + 1:nested_end]
+            nested_members =3D self.extract_members(nested_body)
+
+            # name of the anonymous block (if any)
+            after_brace =3D member_str[nested_end + 1:]
+
+            name =3D self.get_identifier(after_brace)
+            if name:
+                self.log.debug(f"Found nested block named '{name}'")
+                for nm in nested_members:
+                    members.append([name] + nm)
+            else:
+                self.log.debug("Anonymous nested block =E2=80=93 inserting=
 directly")
+                members +=3D nested_members
+
+        self.log.debug(f"extract_members: finished =E2=80=93 found {len(me=
mbers)} members")
+        return members
+
+    def parse(self, text):
+        """
+        Return struct/union ID and its members from a C source code.
+        """
+
+        #
+        # Search for the beginning of the struct. Don't care about its end,
+        # as this will be handled using matching delimiters.
+        #
+        m =3D self.RE_STRUCT.search(text)
+        if not m:
+            return None, []
+
+        #
+        # Pick potential struct/union ID
+        #
+        s_id =3D m.group(1).strip()
+
+        #
+        # Pick the struct contents, if any. Let's use a simple loop, as th=
is
+        # is faster than using regex.
+        #
+        # Please notice that the logic below assumes that there's just one
+        # structure following a given kernel-doc markup. This is different
+        # from the previous kernel-doc behavior.
+        #
+        start =3D m.end()
+        while self.isspace(text[start]):
+            start +=3D 1
+
+        end =3D len(text) - 1
+        while self.isspace(text[end]) or text[end] =3D=3D ";":
+            end -=3D 1
+
+        return s_id, self.extract_members(text[start:end + 1])
diff --git a/tools/unittests/test_members.py b/tools/unittests/test_members=
.py
new file mode 100755
index 000000000000..bdba1d5ef895
--- /dev/null
+++ b/tools/unittests/test_members.py
@@ -0,0 +1,248 @@
+#!/usr/bin/env python3
+
+"""
+Unit tests for struct/union member extractor class.
+"""
+
+
+import os
+import unittest
+import sys
+
+from unittest.mock import MagicMock
+from textwrap import dedent
+
+
+SRC_DIR =3D os.path.dirname(os.path.realpath(__file__))
+sys.path.insert(0, os.path.join(SRC_DIR, "../lib/python"))
+
+from kdoc.kdoc_re import MemberExtractor
+from unittest_helper import run_unittest
+
+#
+# List of tests.
+#
+# The code will dynamically generate one test for each key on this diction=
ary.
+#
+TESTS =3D {
+    #
+    # Invalid data
+    #
+    "no_struct": {
+        "source": "int foo;",
+        "id": None,
+        "members": [],
+    },
+
+    "no_struct_braces": {
+        "source": "struct foo;",
+        "id": "foo",
+        "members": [],
+    },
+
+    #
+    # Start with basics: very simple struct with no inner struct/union
+    #
+    "simple_struct": {
+        "source": "struct foo { int a; };",
+        "id": "foo",
+        "members": [
+            ["a"],
+        ],
+    },
+
+    #
+    # check simple inner anonymous struct: members lists have just one ele=
ment
+    #
+    "simple_inner_anonymous_struct": {
+        "source": dedent("""
+            struct outer {
+                int x;
+                struct inner { float y; };
+            };
+        """),
+        "id": "outer",
+        "members": [
+            ["x"],
+            ["y"],
+        ],
+    },
+
+    #
+    # simple inner named struct: detect if members level will be filled
+    #
+    "simple_inner_named_struct": {
+        "source": dedent("""
+            struct outer2 {
+                int x;
+                struct inner { float y; } z;
+            };
+        """),
+        "id": "outer2",
+        "members": [
+            ["x"],
+            ["z", "y"],
+        ],
+    },
+
+    #
+    # Check if decoding a pointer to an array will work
+    #
+    "array_and_pointer": {
+        "source": dedent("""
+            struct bar {
+                int *ptr;
+                char *arr[10];
+            };
+        """),
+        "id": "bar",
+        "members": [
+            ["ptr"],
+            ["arr"],
+        ],
+    },
+
+    #
+    # complex case with a mix of inner structs and unions
+    #
+    "complex_struct": {
+        # Derivated from include/linux/property.h, line 397
+        "source": dedent("""
+            struct property_entry {
+                const char *name;
+                size_t length;
+                bool is_inline;
+                enum dev_prop_type type;
+                union {
+                    const void *pointer;
+                    struct {
+                        u8 u8_data[sizeof(u64) / sizeof(u8)];
+                        u16 u16_data[sizeof(u64) / sizeof(u16)];
+                        u32 u32_data[sizeof(u64) / sizeof(u32)];
+                        u64 u64_data[sizeof(u64) / sizeof(u64)];
+                        const char *str[sizeof(u64) / sizeof(char *)];
+                    } value;
+                };
+                struct {
+                    const void *pointer;
+                    union {
+                        u8 u8_data[sizeof(u64) / sizeof(u8)];
+                        u16 u16_data[sizeof(u64) / sizeof(u16)];
+                        u32 u32_data[sizeof(u64) / sizeof(u32)];
+                        u64 u64_data[sizeof(u64) / sizeof(u64)];
+                        const char *str[sizeof(u64) / sizeof(char *)];
+                    } value2;
+                } foo;
+            }
+        """),
+        "id": "property_entry",
+        "members": [
+            #
+            # Direct members
+            #
+            ["name"],
+            ["length"],
+            ["is_inline"],
+            ["type"],
+            ["pointer"],
+
+            #
+            # Members from a named struct inside an anonymous union
+            #
+            ["value", "u8_data"],
+            ["value", "u16_data"],
+            ["value", "u32_data"],
+            ["value", "u64_data"],
+            ["value", "str"],
+
+            #
+            # 3-level Members from both named struct and union
+            #
+            ['foo', 'pointer'],
+            ["foo", "value2", "u8_data"],
+            ["foo", "value2", "u16_data"],
+            ["foo", "value2", "u32_data"],
+            ["foo", "value2", "u64_data"],
+            ["foo", "value2", "str"],
+        ],
+    },
+
+    "struct_group_tagged": {
+        # Derivated from include/net/page_pool/types.h line 78
+        "source": dedent("""
+                struct page_pool_params {
+                    struct page_pool_params_fast {
+                        unsigned int order;
+                        unsigned int pool_size;
+                        int nid;
+                        struct device *dev;
+                        struct napi_struct *napi;
+                        enum dma_data_direction dma_dir;
+                        unsigned int max_len;
+                        unsigned int offset;
+                    } fast;
+                    struct page_pool_params_slow {
+                        struct net_device *netdev;
+                        unsigned int queue_idx;
+                        unsigned int flags;
+                    } slow;
+                };
+        """),
+        "id": "page_pool_params",
+        "members": [
+            ['fast', 'order'],
+            ['fast', 'pool_size'],
+            ['fast', 'nid'],
+            ['fast', 'dev'],
+            ['fast', 'napi'],
+            ['fast', 'dma_dir'],
+            ['fast', 'max_len'],
+            ['fast', 'offset'],
+            ['slow', 'netdev'],
+            ['slow', 'queue_idx'],
+            ['slow', 'flags'],
+        ],
+    },
+}
+
+
+class TestMemberExtractor(unittest.TestCase):
+    """
+    Main test class. Populated dynamically at runtime.
+    """
+
+    def setUp(self):
+        self.maxDiff =3D None
+
+    def add_test(cls, name, expected_id, source, members):
+        """
+        Dynamically add a test to the class
+        """
+        def test(cls):
+            logger =3D MagicMock()
+
+            extractor =3D MemberExtractor(logger)
+            s_id, result =3D extractor.parse(source)
+
+            cls.assertEqual(s_id, expected_id, msg=3Df'failed on {name}')
+
+            cls.assertEqual(result, members, msg=3Df'failed on {name}')
+
+        test.__name__ =3D f'test_{name}'
+
+        setattr(TestMemberExtractor, test.__name__, test)
+
+
+#
+# Populate TestMemberExtractor class
+#
+test_class =3D TestMemberExtractor()
+for name, test in TESTS.items():
+    test_class.add_test(name, test["id"], test["source"], test["members"])
+
+
+#
+# main
+#
+if __name__ =3D=3D "__main__":
+    run_unittest(__file__)




