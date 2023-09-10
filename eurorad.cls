<?xml version="1.0" encoding="utf-8"?>
<style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" default-locale="en-GB" version="1.0" demote-non-dropping-particle="sort-only">
  <info>
    <title>Eurorad</title>
    <id>http://www.zotero.org/styles/eurorad</id>
    <link href="http://www.zotero.org/styles/eurorad" rel="self"/>
    <link href="http://www.zotero.org/styles/springer-basic-brackets" rel="template"/>
    <link href="https://www.eurorad.org/author-guidelines" rel="documentation"/>
    <author>
      <name>João Fevereiro</name>
      <email>fev@tuta.io</email>
    </author>
    <category citation-format="numeric"/>
    <category field="medicine"/>
    <summary>Style used by the European Society of Radiology (ESR) in EURORAD, a peer-reviewed database of radiological case reports. Based on the Springer Numbered Style, with the DOI replaced by the PMID.</summary>
    <updated>2023-09-10T01:57:27+00:00</updated>
    <rights license="http://creativecommons.org/licenses/by-sa/3.0/">This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License</rights>
  </info>
  <locale>
    <terms>
      <term name="et-al">et al</term>
    </terms>
  </locale>
  <macro name="author">
    <names variable="author">
      <name sort-separator=" " initialize-with="" name-as-sort-order="all" delimiter=", " delimiter-precedes-last="always"/>
      <substitute>
        <names variable="editor"/>
        <names variable="translator"/>
      </substitute>
    </names>
  </macro>
  <macro name="edition">
    <choose>
      <if is-numeric="edition">
        <group delimiter=" ">
          <number variable="edition" form="ordinal"/>
          <text term="edition" form="short" strip-periods="true"/>
        </group>
      </if>
      <else>
        <text variable="edition"/>
      </else>
    </choose>
  </macro>
  <macro name="title">
    <choose>
      <if type="book">
        <group delimiter=", ">
          <text variable="title"/>
          <text macro="edition"/>
        </group>
      </if>
      <else>
        <text variable="title"/>
      </else>
    </choose>
  </macro>
  <macro name="year-parenth">
    <date prefix="(" suffix=")" variable="issued">
      <date-part name="year"/>
    </date>
  </macro>
  <citation collapse="citation-number">
    <sort>
      <key variable="citation-number"/>
    </sort>
    <layout prefix="[" suffix="]" delimiter=", ">
      <text variable="citation-number"/>
    </layout>
  </citation>
  <bibliography et-al-min="5" et-al-use-first="3" second-field-align="flush">
    <layout>
      <text variable="citation-number" suffix=". "/>
      <group delimiter=" ">
        <text macro="author"/>
        <text macro="year-parenth"/>
        <text macro="title"/>
      </group>
      <choose>
        <!--    Book chapter
             Brown B, Aaron M (2001) The politics of nature.
             In: Smith J (ed) The rise of modern genomics, 3rd edn.
             Wiley, New York, pp 230-257 -->
        <if type="chapter paper-conference" match="any">
          <group delimiter=" " prefix=". ">
            <text term="in" text-case="capitalize-first" suffix=":"/>
            <names variable="editor">
              <name sort-separator=" " initialize-with="" name-as-sort-order="all" delimiter=", " delimiter-precedes-last="always"/>
              <label form="short" strip-periods="true" prefix=" (" suffix=")"/>
            </names>
            <group delimiter=", ">
              <text variable="container-title"/>
              <text macro="edition"/>
            </group>
          </group>
          <group prefix=". " delimiter=", ">
            <text variable="publisher"/>
            <text variable="publisher-place"/>
            <group delimiter=" ">
              <label variable="page" form="short" strip-periods="true"/>
              <text variable="page"/>
            </group>
          </group>
        </if>
        <else-if type="article-journal">
          <choose>
            <if variable="page volume" match="any">
              <!--    Journal article
                   Gamelin FX, Baquet G, Berthoin S, Thevenet D, Nourry C, Nottin S, Bosquet L (2009)
                   Effect of high intensity intermittent training on heart rate variability in prepubescent children.
                   Eur J Appl Physiol 105:731-738. doi: 10.1007/s00421-008-0955-8
                   Ideally, the names of all authors should be provided, but the usage of "et al"
                   in long author lists will also be accepted:
                   Smith J, Jones M Jr, Houghton L et al (1999)
                   Future of health insurance. N Engl J Med 965:325-329   -->
              <group prefix=". " delimiter=" ">
                <group delimiter=" ">
                  <text variable="container-title" form="short" strip-periods="true"/>
                  <group delimiter=":">
                    <text variable="volume" suffix=":"/>
                    <text variable="page"/>
                  </group>
                </group>
                <text prefix="(PMID: " variable="PMID" suffix=")"/>
              </group>
            </if>
            <else>
              <!--    Article by DOI
       Slifka MK, Whitton JL (2000) Clinical implications of dysregulated cytokine production.
       J Mol Med. doi:10.1007/s001090000086     -->
              <group prefix=". " delimiter=" ">
                <text variable="container-title" form="short" strip-periods="true"/>
                <text prefix="(PMID: " variable="PMID" suffix=")"/>
              </group>
            </else>
          </choose>
        </else-if>
        <else-if type="bill book graphic legal_case legislation motion_picture report song" match="any">
          <!--    Book
               South J, Blass B (2001) The future of modern genomics. Blackwell, London    -->
          <group prefix=". " delimiter=", ">
            <text variable="publisher"/>
            <text variable="publisher-place"/>
          </group>
        </else-if>
        <else-if type="webpage post-weblog" match="any">
          <!--    Online document
               Doe J (1999) Title of subordinate document. In: The dictionary of substances and their effects.
               Royal Society of Chemistry. Available via DIALOG.
               http://www.rsc.org/dose/title of subordinate document. Accessed 15 Jan 1999
               Unfortunately, "Royal Society of Chemistry. Available via DIALOG." cannot seem to be mapped here -->
          <group prefix=". " delimiter=". ">
            <text prefix="In: " variable="container-title" form="short"/>
            <text variable="URL"/>
            <date variable="accessed">
              <date-part prefix="Accessed " name="day" suffix=" "/>
              <date-part name="month" form="short" suffix=" " strip-periods="true"/>
              <date-part name="year"/>
            </date>
          </group>
        </else-if>
        <else-if type="thesis">
          <!--    Dissertation
               Trent JW (1975) Experimental acute renal failure. Dissertation, University of California       -->
          <group prefix=". " delimiter=", ">
            <text variable="genre" text-case="capitalize-first"/>
            <text variable="publisher"/>
          </group>
        </else-if>
        <else>
          <!--    None of the provided formats need to add manually (some data provided) -->
          <group prefix=". " delimiter=" ">
            <text variable="container-title" form="short"/>
            <group delimiter=":">
              <text variable="volume"/>
              <text variable="page"/>
            </group>
          </group>
        </else>
      </choose>
    </layout>
  </bibliography>
</style>
